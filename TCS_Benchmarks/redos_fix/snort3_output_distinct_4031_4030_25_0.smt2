(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.* (re.comp  (str.to.re "\u{3e}")) ))  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (str.to.re "\u{3c}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{79}")  (str.to.re "\u{59}")) (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{61}")  (str.to.re "\u{41}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}"))  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")))))))))))))))) (re.* (re.comp  (str.to.re "\u{3e}")) ))) )))
(check-sat)
(get-model)