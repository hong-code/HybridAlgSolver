(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{55}")  (str.to.re "\u{45}"))) (re.* (re.range "\u{41}" "\u{5a}") ) )))
(check-sat)
(get-model)