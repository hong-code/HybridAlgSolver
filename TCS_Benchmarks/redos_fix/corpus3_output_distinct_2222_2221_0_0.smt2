(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.++ (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{26}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{3d}")))))))) (re.* (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}")) ))) (re.* (re.union (re.range "\u{00}" "\u{08}") (re.range "\u{0e}" "\u{1f}") (re.range "\u{21}" "\u{84}") (re.range "\u{86}" "\u{9f}") (re.range "\u{a1}" "\u{ff}")) ) )))
(check-sat)
(get-model)