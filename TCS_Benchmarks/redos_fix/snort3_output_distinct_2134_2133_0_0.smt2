(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}"))  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))))) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ))) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) )))
(check-sat)
(get-model)