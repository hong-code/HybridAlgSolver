(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to_re "\u{0A}")) )  (re.++ (re.* (re.comp  (str.to_re "\u{0A}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{66}")  (str.to.re "\u{46}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{61}")  (str.to.re "\u{41}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}"))  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}"))))))))) (re.* (re.comp  (str.to.re "\u{3b}")) ))) (re.* (re.comp  (str.to.re "\u{3b}")) ) )))
(check-sat)
(get-model)