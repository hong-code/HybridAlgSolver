(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}"))) (re.union  (re.++  (str.to.re "\u{20}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}")))  (re.++  (str.to.re "\u{20}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") )) (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}"))))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}"))) (re.union  (re.++  (str.to.re "\u{20}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}")))  (re.++  (str.to.re "\u{20}")  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}"))) (re.union  (re.++  (str.to.re "\u{20}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}")))  (re.++  (str.to.re "\u{20}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") )) (re.++  (str.to.re "\u{2d}") (re.++  (re.++  (re.range "\u{30}" "\u{39}") (re.*  (re.range "\u{30}" "\u{39}") ))  (str.to.re "\u{20}"))))))) )  (re.++  (str.to.re "\u{20}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)