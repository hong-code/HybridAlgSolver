(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) (re.++ (re.opt  (re.union  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{73}")) (re.union  (str.to.re "\u{40}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{26}")  (str.to.re "\u{5f}"))))) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ))) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) )))
(check-sat)
(get-model)