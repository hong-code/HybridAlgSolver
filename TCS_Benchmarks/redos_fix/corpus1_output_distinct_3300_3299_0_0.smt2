(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.comp  (str.to.re "\u{2f}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{2f}") (re.++  (str.to.re "\u{76}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{73}")  (str.to.re "\u{2f}")))))))) (re.+ (re.comp  (str.to.re "\u{2f}")) ))) )))
(check-sat)
(get-model)