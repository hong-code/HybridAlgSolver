(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to.re "\u{22}")) )  (str.to.re "\u{3d}") )))
(check-sat)
(get-model)