(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) (re.opt  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ) )))
(check-sat)
(get-model)