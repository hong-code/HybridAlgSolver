(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (re.++  (str.to.re "\u{22}")  (str.to.re "\u{3e}")) (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{34}") (re.++  (str.to.re "\u{6a}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{73}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3e}") (re.++  (str.to.re "\u{3c}") (re.++  (str.to.re "\u{21}") (re.++  (str.to.re "\u{5b}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{41}")  (str.to.re "\u{5b}")))))))))))))))))))))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) )))
(check-sat)
(get-model)