(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.++  (re.union (str.to_re "")  (re.++  (re.union  (re.++  (str.to.re "\u{32}") (re.range "\u{30}" "\u{34}"))  (re.++  (re.union (str.to_re "")  (re.++  (str.to.re "\u{31}")  (str.to_re ""))) (re.range "\u{30}" "\u{39}")))  (str.to_re ""))) (re.range "\u{30}" "\u{39}")) ) (re.+  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}"))) )) (re.+  (re.++  (re.union (str.to_re "")  (re.++  (re.union  (re.++  (str.to.re "\u{32}") (re.range "\u{30}" "\u{34}"))  (re.++  (re.union (str.to_re "")  (re.++  (str.to.re "\u{31}")  (str.to_re ""))) (re.range "\u{30}" "\u{39}")))  (str.to_re ""))) (re.range "\u{30}" "\u{39}")) )  (re.++  (str.to.re "\u{32}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)