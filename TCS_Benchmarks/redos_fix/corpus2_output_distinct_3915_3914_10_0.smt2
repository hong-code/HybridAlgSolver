(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.comp  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{22}") (re.union  (str.to.re "\u{2a}") (re.union  (str.to.re "\u{3a}") (re.union  (str.to.re "\u{3b}") (re.union (re.range "\u{00}" "\u{1f}") (re.union  (str.to.re "\u{7c}")  (str.to.re "\u{3f}")))))))))) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++ (re.opt  (re.++  (str.to.re "\u{2e}") (re.+ (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) ) (re.+ (re.comp  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{22}") (re.union  (str.to.re "\u{2a}") (re.union  (str.to.re "\u{3a}") (re.union  (str.to.re "\u{3b}") (re.union (re.range "\u{00}" "\u{1f}") (re.union  (str.to.re "\u{7c}")  (str.to.re "\u{3f}")))))))))) ))) )))
(check-sat)
(get-model)