(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))))))  (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))))  (re.++  (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))))))  (re.++  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))))  (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{2b}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))))) )))
(check-sat)
(get-model)