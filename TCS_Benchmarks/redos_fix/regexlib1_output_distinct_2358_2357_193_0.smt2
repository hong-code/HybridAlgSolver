(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{79}") (re.++  (str.to.re "\u{6c}")  (str.to.re "\u{65}"))))) (re.* (re.comp  (str.to.re "\u{22}")) ) )))
(check-sat)
(get-model)