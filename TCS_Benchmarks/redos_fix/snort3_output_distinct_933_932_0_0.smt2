(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.comp  (str.to.re "\u{3c}")) )  (re.++ (re.+ (re.comp  (str.to.re "\u{3c}")) ) (re.+  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}")) )) (re.+  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}")) ) )))
(check-sat)
(get-model)