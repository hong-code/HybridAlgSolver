(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.++  (re.union (str.to_re "")  (re.++  (re.union  (str.to.re "\u{2e}")  (str.to.re "\u{2d}"))  (str.to_re ""))) (re.+  (re.union  (str.to.re "\u{30}") (re.union  (str.to.re "\u{32}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{33}") (re.union  (str.to.re "\u{34}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{38}") (re.union  (str.to.re "\u{39}") (re.union  (str.to.re "\u{3b}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))) )) ) (re.+ (re.opt  (re.union  (str.to.re "\u{30}") (re.union  (str.to.re "\u{32}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{33}") (re.union  (str.to.re "\u{34}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{38}") (re.union  (str.to.re "\u{39}") (re.union  (str.to.re "\u{3b}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))) ) )) (re.+ (re.opt  (re.union  (str.to.re "\u{30}") (re.union  (str.to.re "\u{32}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{33}") (re.union  (str.to.re "\u{34}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{38}") (re.union  (str.to.re "\u{39}") (re.union  (str.to.re "\u{3b}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))))))))))) ) )  (re.++  (str.to.re "\u{61}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)