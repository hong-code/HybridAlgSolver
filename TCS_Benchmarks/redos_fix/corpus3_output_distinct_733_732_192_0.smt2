(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+  (re.union  (str.to.re "\u{20}")  (str.to_re "\u{09}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{22}") (re.++ (re.+  (re.union  (str.to.re "\u{20}")  (str.to_re "\u{09}")) ) (re.++  (str.to.re "\u{4b}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{79}") (re.++  (str.to.re "\u{77}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{3d}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))))))))))) (re.+  (re.union  (str.to.re "\u{20}")  (str.to_re "\u{09}")) ))) )))
(check-sat)
(get-model)