(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.range "\u{30}" "\u{39}") ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{78}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{3d}")  (str.to.re "\u{20}")))))))))))))))))) (re.+ (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)