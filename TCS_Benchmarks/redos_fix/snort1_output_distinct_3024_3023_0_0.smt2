(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) )  (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.comp  (str.to.re "\u{22}")))))))))))))))  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (re.union  (re.++  (re.union  (str.to.re "\u{62}")  (str.to.re "\u{42}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{67}")  (str.to.re "\u{47}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}"))  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}"))))))  (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}"))  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}"))))) (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{22}")))  (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.++ (re.comp  (str.to.re "\u{22}")) (re.comp  (str.to.re "\u{22}")))))))))))))))) )))
(check-sat)
(get-model)