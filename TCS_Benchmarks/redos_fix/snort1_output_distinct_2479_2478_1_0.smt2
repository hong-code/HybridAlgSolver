(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{79}")  (str.to.re "\u{59}")) (re.++  (re.union  (str.to.re "\u{62}")  (str.to.re "\u{42}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}"))  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")))))))))))) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )))
(check-sat)
(get-model)