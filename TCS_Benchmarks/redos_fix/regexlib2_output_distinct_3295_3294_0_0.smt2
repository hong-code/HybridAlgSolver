(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (str.to.re "\u{30}") (re.*  (str.to.re "\u{31}") ))  (str.to.re "\u{30}") )))
(check-sat)
(get-model)