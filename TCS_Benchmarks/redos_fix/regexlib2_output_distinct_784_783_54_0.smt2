(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{25}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))))) ) (re.*  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{61}") (re.union  (str.to.re "\u{25}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{6d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{70}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{3b}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{3d}")  (str.to.re "\u{5f}")))))))))))))) ))  (re.++ (re.*  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{25}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))))) ) (re.++ (re.*  (str.to.re "\u{3f}") ) (re.*  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{61}") (re.union  (str.to.re "\u{25}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{6d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{70}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{3b}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{3d}")  (str.to.re "\u{5f}")))))))))))))) ))) )))
(check-sat)
(get-model)