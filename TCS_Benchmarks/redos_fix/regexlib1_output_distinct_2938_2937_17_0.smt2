(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.range "\u{30}" "\u{39}") ) (re.opt  (str.to.re "\u{2e}") ) )))
(check-sat)
(get-model)