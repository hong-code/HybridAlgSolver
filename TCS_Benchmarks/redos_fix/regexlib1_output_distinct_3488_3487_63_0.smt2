(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )  (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) (re.*  (re.++ (re.opt  (re.++  (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{23}")  (str.to.re "\u{27}"))))))  (re.union  (str.to.re "\u{20}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) ) (re.++ (re.*  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) (re.*  (str.to.re "\u{2e}") ))) )) (re.*  (re.++ (re.opt  (re.++  (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{23}")  (str.to.re "\u{27}"))))))  (re.union  (str.to.re "\u{20}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) ) (re.++ (re.*  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) (re.*  (str.to.re "\u{2e}") ))) ) )))
(check-sat)
(get-model)