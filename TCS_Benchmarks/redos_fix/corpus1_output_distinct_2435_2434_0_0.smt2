(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+  (str.to.re "\u{20}") )  (re.++ (re.+  (str.to.re "\u{20}") ) (re.+ (re.comp  (str.to.re "\u{5d}")) )) (re.+ (re.comp  (str.to.re "\u{5d}")) ) )))
(check-sat)
(get-model)