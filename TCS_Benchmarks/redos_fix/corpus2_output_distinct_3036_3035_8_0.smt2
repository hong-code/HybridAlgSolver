(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+  (re.union (re.range "\u{30}" "\u{39}")  (str.to.re "\u{2e}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{28}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{2c}")  (str.to.re "\u{20}"))))))))))) (re.+  (re.union (re.range "\u{30}" "\u{39}")  (str.to.re "\u{2e}")) ))) )))
(check-sat)
(get-model)