(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union  (str.to.re "\u{3a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))) ) (re.++ (re.*  (re.union  (str.to.re "\u{3a}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) ) (re.* (re.comp  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{3c}") (re.union  (str.to.re "\u{3d}")  (str.to.re "\u{3e}"))))) ))) (re.* (re.comp  (str.to.re "\u{27}")) ) )))
(check-sat)
(get-model)