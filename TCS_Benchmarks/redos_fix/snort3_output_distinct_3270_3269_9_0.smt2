(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{7d}")) ) (re.* (re.comp  (str.to.re "\u{3b}")) ))  (re.++ (re.* (re.comp  (str.to.re "\u{7d}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{68}")  (str.to.re "\u{48}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++ (re.+ (re.comp  (str.to.re "\u{3b}")) ) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{76}")  (str.to.re "\u{56}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}"))  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")))))))))))))))) (re.* (re.comp  (str.to.re "\u{3b}")) ))) )))
(check-sat)
(get-model)