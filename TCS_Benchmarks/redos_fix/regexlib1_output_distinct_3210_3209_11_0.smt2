(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.++  (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))))))) (re.*  (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))))))) ))  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))))))  (re.++  (re.++  (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))))))) (re.*  (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}")))))) (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.range "\u{61}" "\u{7a}"))))))))))) )) (re.++  (re.union   (re.union (re.+  (str.to.re "\u{20}") ) (re.union  (re.union  (str.to.re "\u{78}")  (str.to.re "\u{58}"))  (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{78}") (re.++  (str.to.re "\u{74}") (re.opt  (str.to.re "\u{2e}") ))))))))  (re.++  (re.union (re.+  (str.to.re "\u{20}") ) (re.union  (re.union  (str.to.re "\u{78}")  (str.to.re "\u{58}"))  (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{78}") (re.++  (str.to.re "\u{74}") (re.opt  (str.to.re "\u{2e}") ))))))))    (re.union (re.+  (str.to.re "\u{20}") ) (re.union  (re.union  (str.to.re "\u{78}")  (str.to.re "\u{58}"))  (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{78}") (re.++  (str.to.re "\u{74}") (re.opt  (str.to.re "\u{2e}") ))))))))))  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))))))) )))
(check-sat)
(get-model)