(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (str.to_re "\u{09}") ) (re.* (re.comp  (str.to_re "\u{09}")) ))  (re.++ (re.*  (str.to_re "\u{09}") ) (re.++ (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}")) (re.* (re.comp  (str.to_re "\u{09}")) ))) )))
(check-sat)
(get-model)