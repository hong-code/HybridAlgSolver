(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union (re.comp  (re.union  (str.to.re "\u{26}") (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{28}")  (str.to.re "\u{29}")))))  (re.++  (str.to.re "\u{26}") (re.++  (str.to.re "\u{71}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{3b}"))))))) ) (re.+  (re.union (re.comp  (re.union  (str.to.re "\u{26}") (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{28}")  (str.to.re "\u{29}")))))  (re.++  (str.to.re "\u{26}") (re.++  (str.to.re "\u{61}") (re.++  (str.to.re "\u{6d}") (re.++  (str.to.re "\u{70}")  (str.to.re "\u{3b}")))))) )) (re.+  (re.union (re.comp  (re.union  (str.to.re "\u{26}") (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) (re.union  (str.to.re "\u{28}")  (str.to.re "\u{29}")))))  (re.++  (str.to.re "\u{26}") (re.++  (str.to.re "\u{71}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{3b}"))))))) )  (re.++  (str.to.re "\u{26}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)