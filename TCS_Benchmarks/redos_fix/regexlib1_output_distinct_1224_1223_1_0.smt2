(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.*  (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{69}") (re.range "\u{30}" "\u{39}"))) )  (re.*  (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{69}") (re.range "\u{30}" "\u{39}"))) ))  (re.++  (re.*  (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{69}") (re.range "\u{30}" "\u{39}"))) ) (re.++ (re.opt  (re.union  (str.to.re "\u{2b}") (re.union  (str.to.re "\u{7c}")  (str.to.re "\u{2d}"))) )  (re.*  (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{69}") (re.range "\u{30}" "\u{39}"))) ))) )))
(check-sat)
(get-model)