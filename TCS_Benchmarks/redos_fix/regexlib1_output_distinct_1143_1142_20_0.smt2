(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.++  (str.to.re "\u{2e}") (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) )) )  (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))))  (re.++ (re.*  (re.++  (str.to.re "\u{2e}") (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) )) ) (re.++  (str.to.re "\u{2e}")  (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))))) )))
(check-sat)
(get-model)