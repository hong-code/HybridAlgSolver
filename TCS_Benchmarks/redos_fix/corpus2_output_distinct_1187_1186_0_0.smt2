(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}"))) )  (re.++ (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}"))) ) (re.++  (re.union  (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{78}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}")))))))))  (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{72}")))))) (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}"))) ))) (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}"))) ) )))
(check-sat)
(get-model)