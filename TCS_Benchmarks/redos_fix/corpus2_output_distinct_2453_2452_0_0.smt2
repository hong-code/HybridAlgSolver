(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (str.to.re "\u{3a}") (re.opt  (str.to.re "\u{3a}") ) )))
(check-sat)
(get-model)