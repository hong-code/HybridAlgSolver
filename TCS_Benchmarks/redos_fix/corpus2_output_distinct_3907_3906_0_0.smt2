(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.union  (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{3d}"))  (re.++  (str.to.re "\u{3d}")   (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{3d}"))))  (re.++  (re.union  (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{3d}"))  (re.++  (str.to.re "\u{3d}")   (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{3d}")))) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.+ (re.comp  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{2c}"))) ))) (re.+ (re.comp  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{2c}"))) ) )))
(check-sat)
(get-model)