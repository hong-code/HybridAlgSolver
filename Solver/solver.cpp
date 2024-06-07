#include "solver.h"

namespace solverbin {
    Solver::Solver() {
    }
    Solver::~Solver() {
        // Constructor
    }
	enum
	{
		Bit1	= 7,
		Bitx	= 6,
		Bit2	= 5,
		Bit3	= 4,
		Bit4	= 3,
		Bit5	= 2, 

		T1	= ((1<<(Bit1+1))-1) ^ 0xFF,	/* 0000 0000 */
		Tx	= ((1<<(Bitx+1))-1) ^ 0xFF,	/* 1000 0000 */
		T2	= ((1<<(Bit2+1))-1) ^ 0xFF,	/* 1100 0000 */
		T3	= ((1<<(Bit3+1))-1) ^ 0xFF,	/* 1110 0000 */
		T4	= ((1<<(Bit4+1))-1) ^ 0xFF,	/* 1111 0000 */
		T5	= ((1<<(Bit5+1))-1) ^ 0xFF,	/* 1111 1000 */

		Rune1	= (1<<(Bit1+0*Bitx))-1,		/* 0000 0000 0111 1111 */
		Rune2	= (1<<(Bit2+1*Bitx))-1,		/* 0000 0111 1111 1111 */
		Rune3	= (1<<(Bit3+2*Bitx))-1,		/* 1111 1111 1111 1111 */
		Rune4	= (1<<(Bit4+3*Bitx))-1,
																					/* 0001 1111 1111 1111 1111 1111 */

		Maskx	= (1<<Bitx)-1,			/* 0011 1111 */
		Testx	= Maskx ^ 0xFF,			/* 1100 0000 */

		Bad	= 0xFFFD,
	};
	int chartorune(unsigned long *rune, std::string &str){
	unsigned char c, c1, c2, c3;
	unsigned long l;

	/*
	 * one character sequence
	 *	00000-0007F => T1
	 */
	c = str[0];
	str.erase(0, 1);
	if(c < Tx) {
		*rune = c;
		return 1;
	}

	/*
	 * two character sequence
	 *	0080-07FF => T2 Tx
	 */
	c1 = str[0] ^ Tx;
	str.erase(0, 1);
	if(c1 & Testx)
		goto bad;
	if(c < T3) {
		if(c < T2)
			goto bad;
		l = ((c << Bitx) | c1) & Rune2;
		if(l <= Rune1)
			goto bad;
		*rune = l;
		return 2;
	}

	/*
	 * three character sequence
	 *	0800-FFFF => T3 Tx Tx
	 */
	c2 = str[0] ^ Tx;
	str.erase(0, 1);
	if(c2 & Testx)
		goto bad;
	if(c < T4) {
		l = ((((c << Bitx) | c1) << Bitx) | c2) & Rune3;
		if(l <= Rune2)
			goto bad;
		*rune = l;
		return 3;
	}

	/*
	 * four character sequence (21-bit value)
	 *	10000-1FFFFF => T4 Tx Tx Tx
	 */
	c2 = str[0] ^ Tx;
	str.erase(0, 1);
	if (c3 & Testx)
		goto bad;
	if (c < T5) {
		l = ((((((c << Bitx) | c1) << Bitx) | c2) << Bitx) | c3) & Rune4;
		if (l <= Rune3)
			goto bad;
		*rune = l;
		return 4;
	}

	/*
	 * Support for 5-byte or longer UTF-8 would go here, but
	 * since we don't have that, we'll just fall through to bad.
	 */

	/*
	 * bad decoding
	 */
bad:
	*rune = Bad;
	return 1;
	}

	enum
	{
		UTFmax	= 4,		/* maximum bytes per rune */
		Runesync	= 0x80,		/* cannot represent part of a UTF sequence (<) */
		Runeself	= 0x80,		/* rune and UTF sequences are the same (<) */
		Runeerror	= 0xFFFD,	/* decoding error in UTF */
		Runemax	= 0x10FFFF,	/* maximum rune value */
	};


	int REnodeClass::runetochar(char *str, const int_21 *rune)
	{
		/* Runes are signed, so convert to unsigned for range check. */
		unsigned int c;

		/*
		* one character sequence
		*	00000-0007F => 00-7F
		*/
		c = *rune;
		if(c <= Rune1) {
			str[0] = static_cast<char>(c);
			return 1;
		}

		/*
		* two character sequence
		*	0080-07FF => T2 Tx
		*/
		if(c <= Rune2) {
			str[0] = T2 | static_cast<char>(c >> 1*Bitx);
			str[1] = Tx | (c & Maskx);
			return 2;
		}

		/*
		* If the Rune is out of range, convert it to the error rune.
		* Do this test here because the error rune encodes to three bytes.
		* Doing it earlier would duplicate work, since an out of range
		* Rune wouldn't have fit in one or two bytes.
		*/
		if (c > Runemax)
			c = Runeerror;

		/*
		* three character sequence
		*	0800-FFFF => T3 Tx Tx
		*/
		if (c <= Rune3) {
			str[0] = T3 | static_cast<char>(c >> 2*Bitx);
			str[1] = Tx | ((c >> 1*Bitx) & Maskx);
			str[2] = Tx | (c & Maskx);
			return 3;
		}

		/*
		* four character sequence (21-bit value)
		*     10000-1FFFFF => T4 Tx Tx Tx
		*/
		str[0] = T4 | static_cast<char>(c >> 3*Bitx);
		str[1] = Tx | ((c >> 2*Bitx) & Maskx);
		str[2] = Tx | ((c >> 1*Bitx) & Maskx);
		str[3] = Tx | (c & Maskx);
		return 4;
	}

	static int MaxRune(int len) {
		int b;  // number of Rune bits in len-byte UTF-8 sequence (len < UTFmax)
		if (len == 1)
			b = 7;
		else
			b = 8-(len+1) + 6*(len-1);
		return (1<<b) - 1;   // maximum Rune for b bits.
	}


	void REnodeClass::BuildBytemap(uint8_t* Bytemap, std::set<RuneClass>& BytemapClass){
		int color1 = color_max;
		for (auto it : BytemapClass){
			std::map<int, int> color2color;
			for (int low = it.min; low <= it.max; low++){
				auto cc = color2color.find(Bytemap[low]);
				if (cc == color2color.end()){
					color_max++;
					color2color.insert(std::make_pair(Bytemap[low], color_max));
					Bytemap[low] = color_max;
				}
				else {
					Bytemap[low] = cc->second;
				}
			}
		}
	}

	void REnodeClass::ComputeAlphabet(uint8_t* ByteMap, std::set<uint8_t> &Alphabet){
		std::set<uint8_t> color_set;
		color_set.insert(ByteMap[0]);
		if (ByteMap[0] != 0)
			Alphabet.insert(0);
		for (int i = 0; i < 256; i++){
			if (color_set.find(ByteMap[i]) != color_set.end()) 
				continue;
			else{
				color_set.insert(ByteMap[i]);
				if (ByteMap[i] != 0)
					Alphabet.insert(i);
			}
		}
	}

	void REnodeClass::ConvertToUTF_8(int_21 min, int_21 max, RuneSequence& RS){
		if (min > max)
			return; 
		for (int i = 1; i < UTFmax; i++) {
			int_21 Splitter = MaxRune(i);
			if (min <= Splitter && Splitter < max) {
				ConvertToUTF_8(min, Splitter, RS);
				ConvertToUTF_8(Splitter+1, max, RS);
				return;
			}
		}

		if (max < 128) {
			REnode* RC = REnodeClass::initREnode(Kind::REGEXP_CHARCLASS, RuneClass{0, 0});
	//    RC->Kind = RegExpSymbolic::REGEXP_OP_KIND::REGEXP_charclass;
			RC->Rune_Class.min = min;
			RC->Rune_Class.max = max;
			BytemapRange.insert(RC->Rune_Class);
			RS.emplace_back(RC);
			return;
		}

		for (int i = 1; i < UTFmax; i++) {
			uint32_t m = (1<<(6*i)) - 1;  // last i bytes of a UTF-8 sequence
			if ((min & ~m) != (max & ~m)) {
				if ((min & m) != 0) {
					ConvertToUTF_8(min, min|m, RS);
					ConvertToUTF_8((min|m)+1, max, RS);
					return;
				}
				if ((max & m) != m) {
					ConvertToUTF_8(min, (max&~m)-1, RS);
					ConvertToUTF_8(max&~m, max, RS);
					return;
				}
			}
		}

		uint8_t ulo[UTFmax], uhi[UTFmax];
		int n = runetochar(reinterpret_cast<char*>(ulo), &min);
		int m = runetochar(reinterpret_cast<char*>(uhi), &max);
		if (n != m)
			exit(0);
		REnode* RConcat = solverbin::REnodeClass::initREnode(Kind::REGEXP_CONCAT, RuneClass{0, 0});
		REnode* RCharClass1 = REnodeClass::initREnode(Kind::REGEXP_CHARCLASS, RuneClass{0, 0});
		RuneClass RC;
		bool IsFirst = false;
		for (int i = 0; i < n; i++) {
			REnode* RCharClass = REnodeClass::initREnode(Kind::REGEXP_CHARCLASS, RuneClass{0, 0});
			if (ulo[i] <= uhi[i]){
				RC.min = ulo[i];
				RC.max = uhi[i];
				BytemapRange.insert(RC);
				RCharClass->Rune_Class = RC;
				if (!IsFirst){
					RCharClass1 = RCharClass;
					RConcat->Children.emplace_back(RCharClass1);
					IsFirst = true;
				}    
				else{
					RConcat->Children.emplace_back(RCharClass);
				}
			}
		}
		if (n == 1)
			RS.emplace_back(RCharClass1);
		else
			RS.emplace_back(RConcat);
		return;
	}

}