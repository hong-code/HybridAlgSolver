(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.union  (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))))  (re.++  (re.union  (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))) (re.++ (re.opt  (str.to.re "\u{20}") )  (re.union  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))))))  (re.union  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))))) )))
(check-sat)
(get-model)