(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ))  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{78}")  (str.to.re "\u{58}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (str.to.re "\u{00}") (re.++ (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ) (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{00}"))))))))))) (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ))) )))
(check-sat)
(get-model)