(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++ (re.+ (re.range "\u{41}" "\u{5a}") )  (str.to.re "\u{2e}")) (re.union  (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}")) (re.union  (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{68}")  (str.to.re "\u{65}"))) (re.union  (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}")  (str.to.re "\u{72}"))) (re.union  (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{61}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{64}")  (str.to.re "\u{65}")) (re.union  (re.++  (str.to.re "\u{62}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6e}")  (str.to.re "\u{64}")))  (re.++ (re.opt  (re.++ (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ) (re.opt  (str.to.re "\u{2d}") )) ) (re.++ (re.range "\u{41}" "\u{5a}") (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) )))))))))))) ) (re.+  (re.union  (re.++ (re.+ (re.range "\u{41}" "\u{5a}") )  (str.to.re "\u{2e}")) (re.union  (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}")) (re.union  (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{68}")  (str.to.re "\u{65}"))) (re.union  (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}")  (str.to.re "\u{72}"))) (re.union  (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{61}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{64}")  (str.to.re "\u{65}")) (re.union  (re.++  (str.to.re "\u{62}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6e}")  (str.to.re "\u{64}")))  (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{66}"))))))))))) )) (re.+  (re.union  (re.++ (re.+ (re.range "\u{41}" "\u{5a}") )  (str.to.re "\u{2e}")) (re.union  (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}")) (re.union  (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{68}")  (str.to.re "\u{65}"))) (re.union  (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}")  (str.to.re "\u{72}"))) (re.union  (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{61}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{64}")  (str.to.re "\u{65}")) (re.union  (re.++  (str.to.re "\u{62}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6e}")  (str.to.re "\u{64}")))  (re.++ (re.opt  (re.++ (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ) (re.opt  (str.to.re "\u{2d}") )) ) (re.++ (re.range "\u{41}" "\u{5a}") (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) )))))))))))) )  (re.++  (str.to.re "\u{6f}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)