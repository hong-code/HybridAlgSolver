(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.* (re.comp  (str.to.re "\u{3e}")) ))  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3d}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")) (re.++ (re.* (re.comp  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))) ) (re.++  (str.to.re "\u{2e}") (re.++  (re.union  (str.to.re "\u{6a}")  (str.to.re "\u{4a}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}"))  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))))))))))) (re.* (re.comp  (str.to.re "\u{3e}")) ))) )))
(check-sat)
(get-model)