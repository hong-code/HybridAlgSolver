(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.range "\u{30}" "\u{39}") ))  (re.++ (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{2f}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{2f}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{2d}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{6b}")  (str.to.re "\u{2f}"))))))))))))))))))))) (re.+ (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)