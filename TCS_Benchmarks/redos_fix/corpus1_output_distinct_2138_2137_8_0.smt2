(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.comp  (str.to.re "\u{20}")) )  (re.++ (re.+ (re.comp  (str.to.re "\u{20}")) ) (re.++  (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{27}")) (re.+ (re.comp  (str.to.re "\u{22}")) ))) (re.+ (re.comp  (str.to.re "\u{22}")) ) )))
(check-sat)
(get-model)