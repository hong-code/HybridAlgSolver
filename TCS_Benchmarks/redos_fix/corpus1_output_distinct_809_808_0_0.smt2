(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.++  (str.to.re "\u{28}") (re.++  (re.union (re.+ (re.range "\u{30}" "\u{39}") ) (re.union  (re.++  (str.to.re "\u{52}")  (str.to.re "\u{58}"))  (re.++  (str.to.re "\u{43}")  (str.to.re "\u{52}"))))  (str.to.re "\u{29}"))) ) (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))  (re.++ (re.*  (re.++  (str.to.re "\u{28}") (re.++  (re.union (re.+ (re.range "\u{30}" "\u{39}") ) (re.union  (re.++  (str.to.re "\u{52}")  (str.to.re "\u{58}"))  (re.++  (str.to.re "\u{43}")  (str.to.re "\u{52}"))))  (str.to.re "\u{29}"))) ) (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)