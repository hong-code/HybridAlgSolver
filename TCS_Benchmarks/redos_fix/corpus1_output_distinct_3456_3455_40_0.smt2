(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{56}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{20}") (re.++ (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{20}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{3a}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{20}") (re.+  (re.union  (str.to.re "\u{3a}") (re.range "\u{30}" "\u{39}")) ))))))))))))))))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) )))
(check-sat)
(get-model)