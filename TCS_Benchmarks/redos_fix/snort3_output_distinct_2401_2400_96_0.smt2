(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to.re "\u{3e}")) )  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (str.to.re "\u{2d}") (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{7a}")  (str.to.re "\u{5a}")) (re.++  (str.to.re "\u{2d}") (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{75}")  (str.to.re "\u{55}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (str.to.re "\u{2d}") (re.++  (re.union  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{75}")  (str.to.re "\u{55}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}"))  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))))))  (re.++  (re.union  (str.to.re "\u{77}")  (str.to.re "\u{57}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))  (re.union  (str.to.re "\u{68}")  (str.to.re "\u{48}"))))))) (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{75}")  (str.to.re "\u{55}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (str.to.re "\u{2e}") (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{79}")  (str.to.re "\u{59}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (str.to.re "\u{2e}") (re.++  (re.union  (str.to.re "\u{68}")  (str.to.re "\u{48}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{67}")  (str.to.re "\u{47}")) (re.++  (re.union  (str.to.re "\u{68}")  (str.to.re "\u{48}"))  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))))))))))))))))))))))))))))))))))))))))))) (re.* (re.comp  (str.to.re "\u{3e}")) ))) (re.* (re.comp  (str.to.re "\u{3e}")) ) )))
(check-sat)
(get-model)