(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) )  (re.++ (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (str.to.re "\u{22}")))))))) (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ))) (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) )))
(check-sat)
(get-model)