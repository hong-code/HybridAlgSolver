(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.opt (re.range "\u{30}" "\u{31}") )  (re.union  (re.range "\u{30}" "\u{39}")  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))) )))
(check-sat)
(get-model)