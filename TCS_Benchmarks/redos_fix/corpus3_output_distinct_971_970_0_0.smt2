(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{28}") (re.union  (str.to.re "\u{29}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{2f}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{3e}")  (str.to.re "\u{5f}"))))))))))))) ))  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{28}") (re.union  (str.to.re "\u{29}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{41}" "\u{5a}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{2f}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{3e}")  (str.to.re "\u{5f}"))))))))))))) )) )))
(check-sat)
(get-model)