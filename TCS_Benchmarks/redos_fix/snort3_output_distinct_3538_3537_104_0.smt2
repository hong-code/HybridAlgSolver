(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.union  (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))))))) (re.union  (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))))))))  (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))))))))))))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{26}")  (re.union  (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))))))) (re.union  (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))))))))  (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))))))))))))) )))
(check-sat)
(get-model)