(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (str.to.re "\u{27}") (re.++  (re.union   (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))    (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) (re.++  (str.to.re "\u{73}")  (str.to.re "\u{27}"))))  (re.++  (str.to.re "\u{27}") (re.++  (re.union   (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))    (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) )))
(check-sat)
(get-model)