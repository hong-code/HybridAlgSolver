(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) ) (re.+  (re.++  (str.to.re "\u{2e}") (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) )) ))  (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) ) (re.+  (re.++  (str.to.re "\u{2e}") (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")))))) )) )) )))
(check-sat)
(get-model)