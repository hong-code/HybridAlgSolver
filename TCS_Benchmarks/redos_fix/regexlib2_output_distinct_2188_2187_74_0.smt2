(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (str.to.re "\u{30}") (re.union  (re.++  (str.to.re "\u{31}")  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))))) (re.union  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}"))) (re.union  (re.++ (re.range "\u{33}" "\u{39}") (re.opt (re.range "\u{30}" "\u{39}") ))  (re.++  (str.to.re "\u{32}") (re.opt (re.range "\u{30}" "\u{39}") )))))) ) (re.+  (re.union  (str.to.re "\u{30}") (re.union  (re.++  (str.to.re "\u{31}")  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))))) (re.union  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}"))) (re.union  (re.++ (re.range "\u{33}" "\u{39}") (re.opt (re.range "\u{30}" "\u{39}") ))  (re.++  (str.to.re "\u{32}") (re.++ (re.range "\u{30}" "\u{34}") (re.range "\u{30}" "\u{39}"))))))) )) (re.+  (re.union  (str.to.re "\u{30}") (re.union  (re.++  (str.to.re "\u{31}")  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re "")))))) (re.union  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}"))) (re.union  (re.++ (re.range "\u{33}" "\u{39}") (re.opt (re.range "\u{30}" "\u{39}") ))  (re.++  (str.to.re "\u{32}") (re.opt (re.range "\u{30}" "\u{39}") )))))) )  (re.++  (str.to.re "\u{32}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)