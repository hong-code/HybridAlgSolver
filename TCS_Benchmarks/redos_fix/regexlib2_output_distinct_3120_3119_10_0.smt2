(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) )  (re.++ (re.range "\u{32}" "\u{39}") (re.++ (re.range "\u{32}" "\u{39}") (re.range "\u{32}" "\u{39}"))))  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) ) (re.++ (re.range "\u{70}" "\u{7a}")  (re.++ (re.range "\u{32}" "\u{39}") (re.++ (re.range "\u{32}" "\u{39}") (re.range "\u{32}" "\u{39}"))))) )))
(check-sat)
(get-model)