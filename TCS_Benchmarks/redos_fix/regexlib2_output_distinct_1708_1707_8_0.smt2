(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.++  (re.union (re.+ (re.range "\u{30}" "\u{39}") ) (re.union  (re.++  (str.to.re "\u{31}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))) (re.union  (re.++  (str.to.re "\u{32}") (re.++ (re.range "\u{30}" "\u{34}") (re.range "\u{30}" "\u{39}")))  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}")))))) (re.opt  (str.to.re "\u{2e}") )) (re.++  (re.++  (re.union (re.+ (re.range "\u{30}" "\u{39}") ) (re.union  (re.++  (str.to.re "\u{31}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))) (re.union  (re.++  (str.to.re "\u{32}") (re.++ (re.range "\u{30}" "\u{34}") (re.range "\u{30}" "\u{39}")))  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}")))))) (re.opt  (str.to.re "\u{2e}") )) (re.++  (re.++  (re.union (re.+ (re.range "\u{30}" "\u{39}") ) (re.union  (re.++  (str.to.re "\u{31}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))) (re.union  (re.++  (str.to.re "\u{32}") (re.++ (re.range "\u{30}" "\u{34}") (re.range "\u{30}" "\u{39}")))  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}")))))) (re.opt  (str.to.re "\u{2e}") ))  (re.++  (re.union (re.+ (re.range "\u{30}" "\u{39}") ) (re.union  (re.++  (str.to.re "\u{31}") (re.++ (re.range "\u{30}" "\u{39}") (re.range "\u{30}" "\u{39}"))) (re.union  (re.++  (str.to.re "\u{32}") (re.++ (re.range "\u{30}" "\u{34}") (re.range "\u{30}" "\u{39}")))  (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{35}") (re.range "\u{30}" "\u{35}")))))) (re.opt  (str.to.re "\u{2e}") ))))) (re.+ (re.range "\u{30}" "\u{39}") ) )))
(check-sat)
(get-model)