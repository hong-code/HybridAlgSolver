(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (str.to.re "\u{27}") (re.* (re.comp  (str.to.re "\u{27}")) ))  (str.to.re "\u{27}") )))
(check-sat)
(get-model)