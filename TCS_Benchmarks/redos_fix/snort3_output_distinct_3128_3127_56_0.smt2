(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))) ) (re.* (re.comp  (str.to.re "\u{3e}")) ))  (re.++ (re.* (re.comp  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))) ) (re.++  (re.++  (str.to.re "\u{2e}") (re.++  (re.union  (str.to.re "\u{6a}")  (str.to.re "\u{4a}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}"))  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))) (re.* (re.comp  (str.to.re "\u{3e}")) ))) )))
(check-sat)
(get-model)