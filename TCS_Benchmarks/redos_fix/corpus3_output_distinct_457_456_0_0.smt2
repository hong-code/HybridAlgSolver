(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{28}") (re.union  (str.to.re "\u{29}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))))))))) )  (re.++ (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{28}") (re.union  (str.to.re "\u{29}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))))))))) ) (re.+  (str.to.re "\u{20}") )) (re.+  (str.to.re "\u{20}") ) )))
(check-sat)
(get-model)