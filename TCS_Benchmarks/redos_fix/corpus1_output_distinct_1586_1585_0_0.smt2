(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.comp  (re.union  (str.to_re "\u{0A}") (re.union  (str.to_re "\u{0D}")  (str.to_re "\u{09}")))) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{3b}") (re.++  (str.to.re "\u{22}")  (str.to_re "\u{09}"))) (re.+ (re.comp  (re.union  (str.to_re "\u{0A}") (re.union  (str.to_re "\u{0D}")  (str.to_re "\u{09}")))) ))) )))
(check-sat)
(get-model)