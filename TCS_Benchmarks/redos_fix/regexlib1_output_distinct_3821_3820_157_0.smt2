(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.++ (re.opt  (re.++  (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))))) (re.++ (re.opt  (str.to.re "\u{2e}") ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )  (re.union   (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{27}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++  (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{27}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))    (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{27}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))))) (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ))  (re.++  (re.++ (re.opt  (re.++  (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))) (re.union  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))  (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))   (re.++  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}"))))))) (re.++ (re.opt  (str.to.re "\u{2e}") ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )  (re.union   (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{27}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++  (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{27}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))    (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{27}") (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))))) (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) )) )))
(check-sat)
(get-model)