(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.++  (str.to.re "\u{2e}") (re.+  (re.union  (str.to.re "\u{60}") (re.union  (str.to.re "\u{7c}") (re.union  (str.to.re "\u{21}") (re.union  (str.to.re "\u{5e}") (re.union  (str.to.re "\u{23}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{25}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{27}") (re.union  (str.to.re "\u{24}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2a}") (re.union (re.range "\u{61}" "\u{7a}") (re.union  (str.to.re "\u{2b}") (re.union  (str.to.re "\u{2f}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{3d}") (re.union  (str.to.re "\u{7d}") (re.union  (str.to.re "\u{7e}") (re.union  (str.to.re "\u{5f}")  (str.to.re "\u{7b}")))))))))))))))))))))) )) ) (re.*  (re.++  (str.to.re "\u{2e}") (re.+  (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.range "\u{61}" "\u{7a}"))) )) ) )))
(check-sat)
(get-model)