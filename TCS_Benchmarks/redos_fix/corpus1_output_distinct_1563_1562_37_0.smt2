(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )  (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.+ (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) )) (re.+ (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) )))
(check-sat)
(get-model)