(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.++  (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to.re "\u{27}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))) ) (re.opt  (re.++  (str.to.re "\u{2c}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ))) )) ) (re.+   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) (re.++ (re.*  (re.++ (re.opt  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}")  (str.to.re "\u{5f}"))) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )) ) (re.++  (str.to.re "\u{40}") (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) (re.++ (re.*  (re.++ (re.opt  (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{2e}")) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )) ) (re.++  (str.to.re "\u{2e}")  (re.++  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) (re.*  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )))))))) )) (re.+   (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) (re.++ (re.*  (re.++ (re.opt  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2e}")  (str.to.re "\u{5f}"))) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )) ) (re.++  (str.to.re "\u{40}") (re.++ (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) ) (re.++ (re.*  (re.++ (re.opt  (re.union  (str.to.re "\u{2d}")  (str.to.re "\u{2e}")) ) (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )) ) (re.++  (str.to.re "\u{2e}")  (re.++  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) (re.*  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) )))))))) )  (re.++  (str.to.re "\u{41}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)