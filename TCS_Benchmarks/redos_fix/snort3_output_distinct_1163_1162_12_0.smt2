(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.comp  (str.to.re "\u{3e}")) )  (re.++ (re.+ (re.comp  (str.to.re "\u{3e}")) ) (re.++  (str.to.re "\u{3f}") (re.* (re.comp  (str.to.re "\u{3e}")) ))) (re.* (re.comp  (str.to.re "\u{3e}")) ) )))
(check-sat)
(get-model)