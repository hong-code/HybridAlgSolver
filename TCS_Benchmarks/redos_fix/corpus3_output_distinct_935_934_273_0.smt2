(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))) (re.++ (re.*  (re.union  (str.to.re "\u{5d}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{5f}")  (str.to.re "\u{5b}"))))))) ) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++ (re.+  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))) (re.++ (re.*  (re.union  (str.to.re "\u{5d}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{5f}")  (str.to.re "\u{5b}"))))))) ) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) ) (re.++  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))) (re.*  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))) )) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )))
(check-sat)
(get-model)