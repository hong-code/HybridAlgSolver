(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.* (re.comp  (re.union  (str.to_re "\u{0A}") (re.union  (str.to_re "\u{0D}")  (str.to.re "\u{26}")))) ))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3d}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (re.union  (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")))))))  (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}"))  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")))))) (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3d}") (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )))))))))))))) (re.* (re.comp  (re.union  (str.to_re "\u{0A}") (re.union  (str.to_re "\u{0D}")  (str.to.re "\u{26}")))) ))) )))
(check-sat)
(get-model)