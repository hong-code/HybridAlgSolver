(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.comp  (str.to.re "\u{3d}")) )  (re.++ (re.+ (re.comp  (str.to.re "\u{3d}")) ) (re.++  (re.union  (str.to.re "\u{5d}")  (str.to.re "\u{29}")) (re.* (re.comp  (str.to.re "\u{3d}")) ))) (re.* (re.comp  (str.to.re "\u{3d}")) ) )))
(check-sat)
(get-model)