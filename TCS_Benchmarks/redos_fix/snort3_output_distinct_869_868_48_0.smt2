(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++  (str.to.re "\u{2e}")  (str.to.re "\u{2e}")))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (str.to.re "\u{2f}")  (str.to.re "\u{5c}"))  (re.++  (str.to.re "\u{2e}")  (str.to.re "\u{2e}")))) )))
(check-sat)
(get-model)