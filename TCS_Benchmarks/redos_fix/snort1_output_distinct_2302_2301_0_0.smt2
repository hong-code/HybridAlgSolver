(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.* (re.comp  (str.to_re "\u{0A}")) )) (re.* (re.comp  (str.to_re "\u{0A}")) ) )))
(check-sat)
(get-model)