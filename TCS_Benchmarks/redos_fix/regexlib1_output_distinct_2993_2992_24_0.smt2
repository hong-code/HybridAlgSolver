(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.union  (str.to.re "\u{30}")  (re.++ (re.+ (re.range "\u{31}" "\u{39}") ) (re.* (re.range "\u{30}" "\u{39}") )))  (re.union  (str.to.re "\u{30}")  (re.++ (re.+ (re.range "\u{31}" "\u{39}") ) (re.* (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)