(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union  (str.to.re "\u{50}") (re.union  (str.to.re "\u{70}")  (str.to.re "\u{7c}"))) ) (re.*  (re.union  (str.to.re "\u{30}") (re.union  (str.to.re "\u{7c}") (re.union  (str.to.re "\u{4f}")  (str.to.re "\u{6f}")))) ))  (re.++ (re.*  (re.union  (str.to.re "\u{50}") (re.union  (str.to.re "\u{70}")  (str.to.re "\u{7c}"))) ) (re.++  (re.++ (re.*  (re.union  (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{53}")  (str.to.re "\u{54}")))  (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{73}")  (str.to.re "\u{74}")))) ) (re.++ (re.*  (str.to.re "\u{2e}") ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) (re.*  (re.union  (str.to.re "\u{30}") (re.union  (str.to.re "\u{7c}") (re.union  (str.to.re "\u{4f}")  (str.to.re "\u{6f}")))) ))) )))
(check-sat)
(get-model)