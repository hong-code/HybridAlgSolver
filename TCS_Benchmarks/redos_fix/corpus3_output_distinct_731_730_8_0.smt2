(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+  (re.union (re.range "\u{31}" "\u{39}") (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{6e}"))) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{20}") (re.++ (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{72}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to.re "\u{6f}")))) )  (str.to.re "\u{20}"))) (re.+  (re.union (re.range "\u{31}" "\u{39}") (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{6e}"))) ))) )))
(check-sat)
(get-model)