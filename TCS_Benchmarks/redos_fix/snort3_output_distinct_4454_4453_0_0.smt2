(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+ (re.comp  (re.union  (str.to.re "\u{0a}")  (str.to.re "\u{0d}"))) )  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))  (re.++ (re.+ (re.comp  (re.union  (str.to.re "\u{0a}")  (str.to.re "\u{0d}"))) )  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}")))))) )))
(check-sat)
(get-model)