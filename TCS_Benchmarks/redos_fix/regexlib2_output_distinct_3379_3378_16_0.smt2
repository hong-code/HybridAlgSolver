(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.opt  (re.union  (re.++  (str.to.re "\u{73}")  (str.to.re "\u{27}"))  (re.++  (str.to.re "\u{27}")  (re.union   (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))    (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))) ) (re.opt  (str.to.re "\u{2c}") ) )))
(check-sat)
(get-model)