(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.opt  (str.to.re "\u{00}") ) )))
(check-sat)
(get-model)