(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.union  (str.to.re "\u{20}")  (str.to_re "\u{09}")) )  (re.++ (re.*  (re.union  (str.to.re "\u{20}")  (str.to_re "\u{09}")) ) (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.*  (re.union  (str.to.re "\u{20}")  (str.to_re "\u{09}")) ))) (re.*  (re.union  (str.to.re "\u{20}")  (str.to_re "\u{09}")) ) )))
(check-sat)
(get-model)