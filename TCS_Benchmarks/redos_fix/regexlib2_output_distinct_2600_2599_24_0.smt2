(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.range "\u{61}" "\u{7a}") )  (re.++ (re.*  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.range "\u{61}" "\u{7a}"))) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) )) )))
(check-sat)
(get-model)