(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to.re "\u{0a}")  (str.to.re "\u{0d}"))) ) (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ))  (re.++ (re.* (re.comp  (re.union  (str.to.re "\u{0a}")  (str.to.re "\u{0d}"))) ) (re.++  (re.++  (str.to.re "\u{2f}") (re.++  (re.union  (str.to.re "\u{61}")  (str.to.re "\u{41}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++ (re.opt  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) )  (str.to.re "\u{2f}")))))))))) (re.+  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) ))) )))
(check-sat)
(get-model)