(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.+ (re.comp  (re.union  (str.to.re "\u{2e}")  (str.to.re "\u{2f}"))) ))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (str.to.re "\u{3d}") (re.++  (re.union  (str.to.re "\u{68}")  (str.to.re "\u{48}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++ (re.opt  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) ) (re.++  (str.to.re "\u{3a}")  (str.to.re "\u{2f}"))))))))))) (re.+ (re.comp  (re.union  (str.to.re "\u{2e}")  (str.to.re "\u{2f}"))) ))) )))
(check-sat)
(get-model)