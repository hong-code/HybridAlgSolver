(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{2d}")  (str.to.re "\u{2d}"))))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (str.to.re "\u{7c}")  (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{2d}")  (str.to.re "\u{2d}"))))) )))
(check-sat)
(get-model)