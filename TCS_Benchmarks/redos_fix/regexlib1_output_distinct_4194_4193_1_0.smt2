(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.union (str.to_re "") (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re ""))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re "")))))  (re.++  (re.union (str.to_re "") (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re ""))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re ""))))) (re.++  (re.++ (re.opt  (str.to.re "\u{24}") ) (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))))))))))) (re.++ (re.opt  (str.to.re "\u{3a}") ) (re.opt  (str.to.re "\u{24}") ))))  (re.union (str.to_re "") (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re ""))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re "")))))))  (re.union (str.to_re "") (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re ""))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (str.to_re ""))))) )))
(check-sat)
(get-model)