(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (str.to.re "\u{7c}") (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (str.to.re "\u{7c}"))) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ))) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) )))
(check-sat)
(get-model)