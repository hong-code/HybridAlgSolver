(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++ (re.range "\u{41}" "\u{5a}") (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ))  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6c}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{6f}")  (str.to.re "\u{6e}")))))))))))))))) ) (re.+  (re.union  (re.++ (re.range "\u{41}" "\u{5a}") (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ))  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}")  (str.to.re "\u{73}")))))))))))))) )) (re.+  (re.union  (re.++ (re.range "\u{41}" "\u{5a}") (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ))  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{66}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6e}") (re.++  (str.to.re "\u{67}")  (str.to.re "\u{73}")))))))))))))) )  (re.++  (str.to.re "\u{53}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)