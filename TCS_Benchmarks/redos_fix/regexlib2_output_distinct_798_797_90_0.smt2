(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.union  (str.to.re "\u{30}") (re.union  (str.to.re "\u{33}") (re.union  (str.to.re "\u{36}")  (str.to.re "\u{39}")))) ) (re.*  (re.union  (str.to.re "\u{30}") (re.union  (str.to.re "\u{33}") (re.union  (str.to.re "\u{36}")  (str.to.re "\u{39}")))) ) )))
(check-sat)
(get-model)