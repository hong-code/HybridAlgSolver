(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.comp  (str.to.re "\u{26}")) )  (re.++ (re.+ (re.comp  (str.to.re "\u{26}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{66}")  (str.to.re "\u{46}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}"))  (str.to.re "\u{3d}"))))) (re.* (re.comp  (str.to.re "\u{26}")) ))) (re.* (re.comp  (str.to.re "\u{26}")) ) )))
(check-sat)
(get-model)