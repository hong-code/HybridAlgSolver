(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (str.to.re "\u{62}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) )))
(check-sat)
(get-model)