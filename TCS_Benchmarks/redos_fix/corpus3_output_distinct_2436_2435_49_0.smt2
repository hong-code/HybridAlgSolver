(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) (re.union (re.range "\u{30}" "\u{39}") (re.union  (re.++  (str.to.re "\u{25}") (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))))  (re.union  (str.to.re "\u{40}") (re.union (re.range "\u{24}" "\u{5f}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{2b}")  (str.to.re "\u{2e}")))))))) ) (re.+  (re.union  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) (re.union (re.range "\u{30}" "\u{39}") (re.union  (re.++  (str.to.re "\u{25}") (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))))  (re.union  (str.to.re "\u{21}") (re.union  (str.to.re "\u{2a}") (re.union  (str.to.re "\u{28}") (re.union  (str.to.re "\u{2c}")  (str.to.re "\u{29}")))))))) )) (re.+  (re.union  (re.union (re.range "\u{41}" "\u{5a}") (re.range "\u{61}" "\u{7a}")) (re.union (re.range "\u{30}" "\u{39}") (re.union  (re.++  (str.to.re "\u{25}") (re.++  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))  (re.union (re.range "\u{41}" "\u{46}") (re.union (re.range "\u{61}" "\u{66}") (re.range "\u{30}" "\u{39}")))))  (re.union  (str.to.re "\u{40}") (re.union (re.range "\u{24}" "\u{5f}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{2b}")  (str.to.re "\u{2e}")))))))) )  (re.++  (str.to.re "\u{28}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)