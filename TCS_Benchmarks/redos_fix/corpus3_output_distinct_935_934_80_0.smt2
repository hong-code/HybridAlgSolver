(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{62}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{63}")))))) (re.union  (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{63}"))))))  (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{65}")  (str.to.re "\u{64}"))))))))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{62}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{63}")))))) (re.union  (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{63}"))))))  (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{65}"))))))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{62}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{63}")))))) (re.union  (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}")  (str.to.re "\u{63}"))))))  (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{65}"))))))))) )  (re.++  (str.to.re "\u{70}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)