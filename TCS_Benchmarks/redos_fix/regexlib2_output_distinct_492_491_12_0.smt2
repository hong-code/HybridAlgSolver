(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) )  (re.++ (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) (re.++ (re.range "\u{41}" "\u{5a}") (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ))) (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) )))
(check-sat)
(get-model)