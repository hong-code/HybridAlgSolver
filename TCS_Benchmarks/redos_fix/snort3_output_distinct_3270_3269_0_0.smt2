(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to.re "\u{7d}")) )  (re.++ (re.* (re.comp  (str.to.re "\u{7d}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{68}")  (str.to.re "\u{48}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}"))  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}"))))) (re.+ (re.comp  (str.to.re "\u{3b}")) ))) (re.+ (re.comp  (str.to.re "\u{3b}")) ) )))
(check-sat)
(get-model)