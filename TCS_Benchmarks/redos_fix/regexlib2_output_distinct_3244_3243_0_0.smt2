(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.++ (re.*  (str.to.re "\u{20}") ) (re.++ (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{5d}") (re.union  (str.to.re "\u{26}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2a}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{5b}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))))) ) (re.++ (re.*  (str.to.re "\u{20}") ) (re.++ (re.opt  (str.to.re "\u{2c}") ) (re.*  (str.to.re "\u{20}") ))))) ) (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{5d}") (re.union  (str.to.re "\u{26}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2a}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{5b}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))))))) ) )))
(check-sat)
(get-model)