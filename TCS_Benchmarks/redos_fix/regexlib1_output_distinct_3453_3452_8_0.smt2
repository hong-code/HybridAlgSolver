(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.opt  (str.to.re "\u{3f}") ) (re.+ (re.comp  (str.to.re "\u{23}")) ) )))
(check-sat)
(get-model)