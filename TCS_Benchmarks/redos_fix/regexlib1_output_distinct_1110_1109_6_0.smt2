(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))))) (re.+  (re.++ (re.opt  (re.union  (str.to.re "\u{2f}") (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{2e}")))) ) (re.+ (re.range "\u{30}" "\u{39}") )) ))  (re.++  (re.union (str.to_re "") (re.union  (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")  (str.to_re ""))))) (re.++ (re.opt  (str.to.re "\u{29}") ) (re.+  (re.++ (re.opt  (re.union  (str.to.re "\u{2f}") (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{2e}")))) ) (re.+ (re.range "\u{30}" "\u{39}") )) ))) )))
(check-sat)
(get-model)