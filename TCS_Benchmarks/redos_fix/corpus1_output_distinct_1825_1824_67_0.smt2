(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.* (re.comp  (re.union  (str.to.re "\u{5c}")  (str.to.re "\u{22}"))) ) )))
(check-sat)
(get-model)