(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to.re "\u{3e}")) )  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{62}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{64}") (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{79}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{65}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3d}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{2f}") (re.++  (str.to.re "\u{6a}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{79}") (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{6b}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{74}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )  (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))))))))))))))))))))))))))))))))))))))))))))))))) (re.* (re.comp  (str.to.re "\u{3e}")) ))) (re.* (re.comp  (str.to.re "\u{3e}")) ) )))
(check-sat)
(get-model)