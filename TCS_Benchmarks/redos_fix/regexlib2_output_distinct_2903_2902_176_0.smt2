(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{65}")  (str.to.re "\u{74}"))  (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6d}")  (str.to.re "\u{65}")))) ) (re.+  (re.union  (re.++  (str.to.re "\u{65}")  (str.to.re "\u{74}"))  (re.union  (str.to.re "\u{70}") (re.union  (str.to.re "\u{61}") (re.union  (str.to.re "\u{72}") (re.union  (str.to.re "\u{63}") (re.union  (str.to.re "\u{65}") (re.union  (str.to.re "\u{75}") (re.union  (str.to.re "\u{66}") (re.union  (str.to.re "\u{67}") (re.union  (str.to.re "\u{69}") (re.union  (str.to.re "\u{7a}") (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{6f}"))))))))))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{65}")  (str.to.re "\u{74}"))  (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6d}")  (str.to.re "\u{65}")))) )  (re.++  (str.to.re "\u{61}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)