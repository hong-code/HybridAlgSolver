(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6e}")  (str.to.re "\u{74}"))))))) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )))
(check-sat)
(get-model)