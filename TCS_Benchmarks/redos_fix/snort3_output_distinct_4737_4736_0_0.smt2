(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to_re "\u{0A}")) )  (re.++ (re.* (re.comp  (str.to_re "\u{0A}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}"))  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))))))))) (re.* (re.comp  (str.to_re "\u{0A}")) ))) (re.* (re.comp  (str.to_re "\u{0A}")) ) )))
(check-sat)
(get-model)