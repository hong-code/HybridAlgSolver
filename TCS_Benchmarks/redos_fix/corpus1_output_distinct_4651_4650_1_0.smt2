(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{2d}")  (str.to.re "\u{3e}")) (re.union  (str.to.re "\u{3a}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{40}") (re.union  (str.to.re "\u{2e}")  (re.++  (str.to.re "\u{3a}")  (str.to.re "\u{3a}"))))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{2d}")  (str.to.re "\u{3e}")) (re.union  (str.to.re "\u{3a}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{40}") (re.union  (str.to.re "\u{2e}")  (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{2f}")  (str.to.re "\u{2f}")))))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{2d}")  (str.to.re "\u{3e}")) (re.union  (str.to.re "\u{3a}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{40}") (re.union  (str.to.re "\u{2e}")  (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{2f}")  (str.to.re "\u{2f}")))))))) )  (re.++  (str.to.re "\u{3a}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)