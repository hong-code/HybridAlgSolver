(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.union  (str.to.re "\u{5c}") (re.union  (str.to.re "\u{40}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{2f}") (re.union (re.range "\u{5c}" "\u{5c}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{5e}") (re.union  (str.to.re "\u{7b}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{24}") (re.union  (str.to.re "\u{25}") (re.union  (str.to.re "\u{28}") (re.union  (str.to.re "\u{29}") (re.union  (str.to.re "\u{2a}") (re.union  (str.to.re "\u{2b}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{73}") (re.union  (str.to.re "\u{3a}") (re.union  (str.to.re "\u{3b}") (re.union  (str.to.re "\u{7c}") (re.union  (str.to.re "\u{7d}") (re.union  (str.to.re "\u{3d}")  (str.to.re "\u{3f}"))))))))))))))))))))))))) )  (str.to.re "\u{73}") )))
(check-sat)
(get-model)