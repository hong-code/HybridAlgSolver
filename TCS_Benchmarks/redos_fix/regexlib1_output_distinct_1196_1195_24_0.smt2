(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (str.to.re "\u{30}") ) (re.opt (re.range "\u{30}" "\u{31}") ) )))
(check-sat)
(get-model)