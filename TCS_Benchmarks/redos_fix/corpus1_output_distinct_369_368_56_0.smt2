(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.opt  (re.union  (str.to.re "\u{30}")  (str.to.re "\u{31}")) ) (re.opt (re.range "\u{30}" "\u{39}") ) )))
(check-sat)
(get-model)