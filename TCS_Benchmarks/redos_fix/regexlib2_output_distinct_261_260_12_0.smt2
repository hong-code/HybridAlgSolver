(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))  (re.++  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))))) (re.++  (re.++ (re.*  (str.to.re "\u{2e}") ) (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")) (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))))))) (re.++  (str.to.re "\u{22}") (re.++  (re.union  (str.to.re "\u{41}") (re.union  (str.to.re "\u{44}") (re.union  (str.to.re "\u{57}") (re.union  (str.to.re "\u{48}") (re.union  (str.to.re "\u{49}")  (str.to.re "\u{7c}"))))))  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{58}")  (str.to.re "\u{7c}"))))))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ))) )))
(check-sat)
(get-model)