(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{2c}")  (str.to.re "\u{20}")) (re.union  (str.to.re "\u{20}")  (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{64}")  (str.to.re "\u{20}"))))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{2c}")  (str.to.re "\u{20}")) (re.union  (str.to.re "\u{20}")  (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{26}")  (str.to.re "\u{20}"))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{2c}")  (str.to.re "\u{20}")) (re.union  (str.to.re "\u{20}")  (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{64}")  (str.to.re "\u{20}"))))))) )  (re.++  (str.to.re "\u{20}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)