(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to_re "\u{09}")) ) (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{3a}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2c}")  (str.to.re "\u{2d}"))))) ))  (re.++ (re.*  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to_re "\u{09}")) ) (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{3a}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2c}")  (str.to.re "\u{2d}"))))) )) )))
(check-sat)
(get-model)