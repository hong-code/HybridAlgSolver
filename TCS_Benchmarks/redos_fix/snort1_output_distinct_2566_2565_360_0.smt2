(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))))))))))))))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (str.to.re "\u{7b}") (re.++  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))))))))) (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))))) (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))))) (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))))))  (str.to.re "\u{2d}")))))))))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.range "\u{30}" "\u{39}")))))))))))))))) )))
(check-sat)
(get-model)