(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.++  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))  (str.to.re "\u{2c}")) )  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))))  (re.++ (re.*  (re.++  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))  (str.to.re "\u{2c}")) )  (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}")))) )))
(check-sat)
(get-model)