(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.+  (re.union  (str.to.re "\u{49}") (re.union  (str.to.re "\u{4c}") (re.union  (str.to.re "\u{4f}") (re.union  (str.to.re "\u{69}") (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{6f}")))))) ))  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.+  (re.union  (str.to.re "\u{49}") (re.union  (str.to.re "\u{4c}") (re.union  (str.to.re "\u{4f}") (re.union  (str.to.re "\u{69}") (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{6f}")))))) )) )))
(check-sat)
(get-model)