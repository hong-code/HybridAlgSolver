(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))))))  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))  (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))))))  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}")))))) )))
(check-sat)
(get-model)