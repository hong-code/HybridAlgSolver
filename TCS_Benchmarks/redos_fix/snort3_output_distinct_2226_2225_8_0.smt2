(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+ (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}")) ) (re.+ (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}")) ))  (re.++ (re.+ (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{7c}") (re.++  (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))  (str.to.re "\u{7c}"))) (re.+ (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}")) ))) )))
(check-sat)
(get-model)