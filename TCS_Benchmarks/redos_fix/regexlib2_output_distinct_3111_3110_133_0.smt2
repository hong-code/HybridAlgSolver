(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.++ (re.+  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) ) (re.++  (str.to.re "\u{5c}") (re.opt (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) ) (re.+  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) ))  (re.++  (re.++ (re.*  (re.++ (re.+  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) ) (re.++  (str.to.re "\u{5c}") (re.opt (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) ) (re.+  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) )) (re.++  (re.++  (str.to.re "\u{5c}") (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")))  (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))) (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))))) (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))))) (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))))))  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))))))))))))))  (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))) (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))))) (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))))) (re.union  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))))))  (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))   (re.++  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))  (re.union  (str.to.re "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))))))))))) )))
(check-sat)
(get-model)