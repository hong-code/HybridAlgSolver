(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.* (re.comp  (str.to.re "\u{3e}")) ))  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}"))  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}"))))))))) (re.* (re.comp  (str.to.re "\u{3e}")) ))) )))
(check-sat)
(get-model)