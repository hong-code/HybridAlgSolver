(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union  (str.to.re "\u{40}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{24}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{5f}") (re.range "\u{61}" "\u{7a}"))))))) )  (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))))))))))  (re.++ (re.*  (re.union  (str.to.re "\u{40}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{24}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{5f}") (re.range "\u{61}" "\u{7a}"))))))) ) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )  (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}"))) (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))))))))))) )))
(check-sat)
(get-model)