(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{22}")) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++ (re.* (re.comp  (str.to.re "\u{22}")) ) (re.++  (re.++  (str.to.re "\u{2e}") (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{61}")  (str.to.re "\u{41}"))  (re.union  (str.to.re "\u{77}")  (str.to.re "\u{57}"))))) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )))
(check-sat)
(get-model)