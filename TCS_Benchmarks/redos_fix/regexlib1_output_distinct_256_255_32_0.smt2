(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{67}")  (str.to.re "\u{3b}"))))) ) (re.* (re.comp  (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{6c}"))))) ))  (re.++ (re.* (re.comp  (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{67}")  (str.to.re "\u{3b}"))))) ) (re.++  (re.++ (re.opt  (str.to_re "\u{0A}") ) (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{3d}") (re.++ (re.opt  (re.union  (re.++  (str.to.re "\u{26}") (re.++  (str.to.re "\u{71}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{3b}"))))))  (str.to.re "\u{27}")) ) (re.++  (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.++  (str.to.re "\u{2e}") (re.++  (str.to.re "\u{6a}") (re.++  (str.to.re "\u{70}")  (str.to.re "\u{67}"))))) (re.++ (re.opt  (re.union  (re.++  (str.to.re "\u{26}") (re.++  (str.to.re "\u{71}") (re.++  (str.to.re "\u{75}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{74}")  (str.to.re "\u{3b}"))))))  (str.to.re "\u{27}")) ) (re.++ (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) ) (re.opt  (str.to_re "\u{0A}") )))))))) (re.* (re.comp  (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{6c}"))))) ))) )))
(check-sat)
(get-model)