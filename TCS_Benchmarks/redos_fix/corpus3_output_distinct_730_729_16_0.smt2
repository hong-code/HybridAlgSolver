(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{72}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to.re "\u{6f}")))) ) (re.+  (re.union (re.range "\u{31}" "\u{39}") (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{6e}"))) ))  (re.++ (re.+  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{72}") (re.union (re.range "\u{41}" "\u{5a}")  (str.to.re "\u{6f}")))) ) (re.++  (str.to.re "\u{20}") (re.+  (re.union (re.range "\u{31}" "\u{39}") (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{6e}"))) ))) )))
(check-sat)
(get-model)