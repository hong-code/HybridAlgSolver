(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4c}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{5f}") (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{5f}") (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{49}") (re.++  (str.to.re "\u{58}") (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{22}") (re.++  (str.to.re "\u{24}") (re.++  (str.to.re "\u{28}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{68}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{7e}") (re.++  (str.to.re "\u{29}")  (str.to.re "\u{2f}"))))))))))))))))))))))))))))) (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{74}") (re.++  (str.to.re "\u{65}")  (str.to.re "\u{6c}")))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) )))
(check-sat)
(get-model)