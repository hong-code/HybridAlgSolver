(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (str.to.re "\u{30}") ) (re.+  (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))))) )) (re.+  (str.to.re "\u{30}") )  (re.++  (str.to.re "\u{30}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)