(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++ (re.+ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}"))  (str.to.re "\u{3d}"))))))))) (re.*  (re.union (re.range "\u{00}" "\u{09}") (re.union (re.range "\u{0e}" "\u{7f}") (re.union  (str.to.re "\u{0c}")  (str.to.re "\u{0b}")))) ))) (re.*  (re.union (re.range "\u{00}" "\u{09}") (re.union (re.range "\u{0e}" "\u{7f}") (re.union  (str.to.re "\u{0c}")  (str.to.re "\u{0b}")))) ) )))
(check-sat)
(get-model)