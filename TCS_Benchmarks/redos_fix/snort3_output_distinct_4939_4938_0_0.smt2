(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to.re "\u{26}")) )  (re.++ (re.* (re.comp  (str.to.re "\u{26}")) ) (re.++  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")) (re.* (re.comp  (str.to.re "\u{26}")) ))) (re.* (re.comp  (str.to.re "\u{26}")) ) )))
(check-sat)
(get-model)