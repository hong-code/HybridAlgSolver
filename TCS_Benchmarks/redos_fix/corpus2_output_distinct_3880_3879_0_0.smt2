(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.range "\u{30}" "\u{39}") ))  (re.++ (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}")  (str.to.re "\u{5f}")))) (re.++  (str.to.re "\u{5b}")  (re.union  (str.to.re "\u{53}")  (str.to.re "\u{73}")))) (re.+ (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)