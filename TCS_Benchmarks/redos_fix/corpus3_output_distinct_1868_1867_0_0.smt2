(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+  (re.union  (str.to.re "\u{62}") (re.union  (re.union   (re.union  (str.to.re "\u{63}")  (str.to.re "\u{65}"))  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{65}"))    (re.union  (str.to.re "\u{63}")  (str.to.re "\u{65}"))))  (str.to.re "\u{64}"))) )  (re.union   (re.union  (str.to.re "\u{63}")  (str.to.re "\u{65}"))  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{65}"))    (re.union  (str.to.re "\u{63}")  (str.to.re "\u{65}")))) )))
(check-sat)
(get-model)