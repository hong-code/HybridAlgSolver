(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.opt  (str.to.re "\u{2e}") ) (re.comp  (str.to.re "\u{5f}")) )))
(check-sat)
(get-model)