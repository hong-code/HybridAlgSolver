(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (re.++  (str.to.re "\u{28}") (re.++ (re.+  (re.union  (str.to.re "\u{78}") (re.union (re.range "\u{41}" "\u{46}") (re.range "\u{30}" "\u{39}"))) ) (re.++  (str.to.re "\u{2c}") (re.++ (re.+  (re.union (re.range "\u{41}" "\u{46}") (re.range "\u{30}" "\u{39}")) )  (str.to.re "\u{29}"))))) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )))
(check-sat)
(get-model)