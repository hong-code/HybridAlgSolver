(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.union (re.+ (re.comp  (str.to.re "\u{22}")) )  (re.++  (str.to.re "\u{22}")  (str.to.re "\u{22}"))) ) (re.+ (re.comp  (str.to.re "\u{22}")) ) )))
(check-sat)
(get-model)