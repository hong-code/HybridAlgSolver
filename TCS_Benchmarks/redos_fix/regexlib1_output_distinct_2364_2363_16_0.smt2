(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))))))  (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))  (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))))))) (re.++  (re.++ (re.opt  (str.to.re "\u{29}") ) (re.++ (re.opt  (re.union  (str.to.re "\u{20}")  (str.to.re "\u{2d}")) ) (re.++  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))) (re.++ (re.opt  (re.union  (str.to.re "\u{20}")  (str.to.re "\u{2d}")) ) (re.++  (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")) (re.opt  (re.union  (str.to.re "\u{20}")  (str.to.re "\u{2d}")) ))))))  (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))) )))
(check-sat)
(get-model)