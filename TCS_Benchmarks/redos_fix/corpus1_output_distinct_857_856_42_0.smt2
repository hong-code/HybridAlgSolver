(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{5c}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}"))))) (re.union  (re.++  (str.to.re "\u{5c}") (re.++  (str.to.re "\u{75}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")))))))  (re.++  (str.to.re "\u{5c}") (re.++  (str.to.re "\u{78}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}"))))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{5c}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}"))))) (re.union  (re.++  (str.to.re "\u{5c}") (re.++  (str.to.re "\u{75}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")))))))  (re.++  (str.to.re "\u{5c}")  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{61}") (re.union  (str.to.re "\u{62}") (re.union  (str.to.re "\u{72}") (re.union  (str.to.re "\u{22}") (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{66}") (re.union  (str.to.re "\u{76}") (re.union  (str.to.re "\u{27}")  (str.to.re "\u{6e}"))))))))))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{5c}") (re.++ (re.range "\u{30}" "\u{39}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}"))))) (re.union  (re.++  (str.to.re "\u{5c}") (re.++  (str.to.re "\u{75}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")))))))  (re.++  (str.to.re "\u{5c}")  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{61}") (re.union  (str.to.re "\u{62}") (re.union  (str.to.re "\u{72}") (re.union  (str.to.re "\u{22}") (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{66}") (re.union  (str.to.re "\u{76}") (re.union  (str.to.re "\u{27}")  (str.to.re "\u{6e}"))))))))))))) )  (re.++  (str.to.re "\u{5c}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)