(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{2f}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{3e}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{26}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{3b}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++ (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{20}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{ff}")) ) (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{22}")  (str.to.re "\u{3e}"))))))))))))))))))))))))))))))))))))))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) )))
(check-sat)
(get-model)