(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.range "\u{30}" "\u{39}") ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{20}"))))))))))))) (re.+ (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)