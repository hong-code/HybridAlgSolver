(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.range "\u{30}" "\u{39}") ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (re.union  (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{51}")  (str.to.re "\u{4c}"))))))))))  (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{70}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{44}")  (str.to.re "\u{42}")))))))))))))  (str.to.re "\u{20}")) (re.+ (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)