(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{56}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{20}") (re.++ (re.+  (re.union (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))  (str.to.re "\u{2d}")) ) (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{77}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{20}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{20}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{20}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{20}") (re.+  (re.union (re.range "\u{30}" "\u{39}")  (str.to.re "\u{2e}")) )))))))))))))))))))))))))))))))))))))))))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) )))
(check-sat)
(get-model)