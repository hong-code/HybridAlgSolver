(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.union  (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{4f}")  (str.to.re "\u{4e}"))) (re.union  (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{55}")  (str.to.re "\u{45}"))) (re.union  (re.++  (str.to.re "\u{57}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{44}"))) (re.union  (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{48}")  (str.to.re "\u{55}"))) (re.union  (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{52}")  (str.to.re "\u{49}"))) (re.union  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{41}")  (str.to.re "\u{54}")))  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{55}")  (str.to.re "\u{4e}"))))))))) (re.* (re.range "\u{41}" "\u{5a}") ) )))
(check-sat)
(get-model)