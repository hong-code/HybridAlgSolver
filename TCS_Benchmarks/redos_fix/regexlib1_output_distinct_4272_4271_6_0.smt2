(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (str.to.re "\u{70}") (re.union  (str.to.re "\u{67}") (re.union  (str.to.re "\u{6a}")  (str.to.re "\u{2e}")))) ) (re.+  (re.union  (str.to.re "\u{66}") (re.union  (str.to.re "\u{67}") (re.union  (str.to.re "\u{69}")  (str.to.re "\u{2e}")))) )) (re.+  (re.union  (str.to.re "\u{66}") (re.union  (str.to.re "\u{67}") (re.union  (str.to.re "\u{69}")  (str.to.re "\u{2e}")))) )  (re.++  (str.to.re "\u{67}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)