(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{3d}") (re.++  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")) (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) )))
(check-sat)
(get-model)