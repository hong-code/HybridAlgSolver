(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (str.to.re "\u{32}")  (str.to.re "\u{2f}")))) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ))) )))
(check-sat)
(get-model)