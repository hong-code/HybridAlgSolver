(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3c}")) ) (re.*  (str.to.re "\u{3c}") ))  (re.++ (re.* (re.comp  (str.to.re "\u{3c}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{29}")) (re.* (re.comp  (str.to.re "\u{3c}")) )) (re.*  (str.to.re "\u{3c}") ))) )))
(check-sat)
(get-model)