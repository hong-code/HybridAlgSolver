(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{72}")  (str.to.re "\u{73}"))) (re.union  (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6e}")  (str.to.re "\u{73}")))) (re.union  (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{6e}")))  (re.++  (str.to.re "\u{68}")  (str.to.re "\u{72}"))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{72}")  (str.to.re "\u{73}"))) (re.union  (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6e}")  (str.to.re "\u{73}")))) (re.union  (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{6e}")))  (str.to.re "\u{68}")))) )) (re.+  (re.union  (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{72}")  (str.to.re "\u{73}"))) (re.union  (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6e}")  (str.to.re "\u{73}")))) (re.union  (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{6e}")))  (re.++  (str.to.re "\u{68}")  (str.to.re "\u{72}"))))) )  (re.++  (str.to.re "\u{68}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)