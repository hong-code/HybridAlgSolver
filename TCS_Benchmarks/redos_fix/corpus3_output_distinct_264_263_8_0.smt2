(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (str.to.re "\u{20}")  (str.to.re "\u{3e}")) ) (re.+ (re.comp  (str.to.re "\u{20}")) ))  (re.++ (re.+  (re.union  (str.to.re "\u{20}")  (str.to.re "\u{3e}")) ) (re.++ (re.+  (str.to.re "\u{20}") ) (re.+ (re.comp  (str.to.re "\u{20}")) ))) )))
(check-sat)
(get-model)