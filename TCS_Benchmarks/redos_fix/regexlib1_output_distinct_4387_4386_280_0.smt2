(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.opt  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{73}")) ) (re.opt  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{73}")) ) )))
(check-sat)
(get-model)