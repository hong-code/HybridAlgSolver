(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.* (re.comp  (str.to.re "\u{3c}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{2c}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{7a}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{3e}") (re.++ (re.opt  (re.++  (str.to.re "\u{3c}") (re.++  (re.union  (str.to.re "\u{42}")  (str.to.re "\u{49}"))  (str.to.re "\u{3e}"))) ) (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{2f}") (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{3e}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{21}") (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{2a}") (re.++  (str.to.re "\u{2a}") (re.++  (str.to.re "\u{2a}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{2a}") (re.++  (str.to.re "\u{2a}") (re.++  (str.to.re "\u{2a}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{3e}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{48}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{47}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{5f}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{3e}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{2c}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{7a}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{3e}") (re.opt  (re.++  (str.to.re "\u{3c}") (re.++  (re.union  (str.to.re "\u{42}")  (str.to.re "\u{49}"))  (str.to.re "\u{3e}"))) ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (re.* (re.comp  (str.to.re "\u{3c}")) ))) )))
(check-sat)
(get-model)