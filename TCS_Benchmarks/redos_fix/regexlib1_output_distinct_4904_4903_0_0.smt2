(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{79}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{72}") (re.++  (str.to.re "\u{64}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{6e}") (re.++ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.++  (str.to.re "\u{63}") (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6d}")))))))))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) )))
(check-sat)
(get-model)