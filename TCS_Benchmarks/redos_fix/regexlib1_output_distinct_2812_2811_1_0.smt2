(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.* (re.comp  (str.to.re "\u{27}")) )  (str.to.re "\u{27}")))  (re.++  (str.to.re "\u{3d}")  (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.comp  (str.to.re "\u{22}")) )  (str.to.re "\u{22}"))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.* (re.comp  (str.to.re "\u{27}")) )  (str.to.re "\u{27}"))) (re.* (re.comp  (re.union  (str.to.re "\u{22}") (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{27}")  (str.to.re "\u{3e}"))))) )) )) (re.+  (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.* (re.comp  (str.to.re "\u{27}")) )  (str.to.re "\u{27}")))  (re.++  (str.to.re "\u{3d}")  (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.comp  (str.to.re "\u{22}")) )  (str.to.re "\u{22}"))))) )  (re.++  (str.to.re "\u{3d}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)