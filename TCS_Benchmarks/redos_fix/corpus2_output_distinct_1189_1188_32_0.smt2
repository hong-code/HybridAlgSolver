(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}"))) ) (re.+ (re.range "\u{30}" "\u{39}") ))  (re.++ (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}"))) ) (re.++  (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{74}") (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))))) (re.+ (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)