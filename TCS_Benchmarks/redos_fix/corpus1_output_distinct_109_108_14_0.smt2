(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.* (re.comp  (str.to_re "\u{0A}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{20}")  (str.to.re "\u{27}"))))))))))) (re.* (re.comp  (str.to_re "\u{0A}")) ))) )))
(check-sat)
(get-model)