(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.opt (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{40}") (re.range "\u{5b}" "\u{5e}") (re.range "\u{60}" "\u{60}") (re.range "\u{7b}" "\u{a9}") (re.range "\u{ab}" "\u{b4}") (re.range "\u{b6}" "\u{b9}") (re.range "\u{bb}" "\u{bf}") (re.range "\u{d7}" "\u{d7}") (re.range "\u{f7}" "\u{f7}")) ) (re.opt  (str.to.re "\u{2e}") ) )))
(check-sat)
(get-model)