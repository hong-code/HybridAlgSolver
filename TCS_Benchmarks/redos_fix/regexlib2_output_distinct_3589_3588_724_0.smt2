(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (str.to.re "\u{32}")  (re.++  (str.to.re "\u{34}") (re.++  (re.union  (str.to.re "\u{32}")  (re.++  (str.to.re "\u{34}")  (str.to.re "\u{30}")))  (str.to.re "\u{30}")))) ) (re.+  (re.union  (str.to.re "\u{32}")  (re.++  (re.union  (str.to.re "\u{33}") (re.union  (re.++  (str.to.re "\u{34}")  (str.to.re "\u{31}"))  (re.++  (str.to.re "\u{34}") (re.++  (str.to.re "\u{35}") (re.++  (str.to.re "\u{30}")  (str.to.re "\u{30}")))))) (re.++ (re.*  (re.union  (re.++  (str.to.re "\u{35}") (re.++  (str.to.re "\u{30}")  (str.to.re "\u{31}")))  (re.++  (re.union  (str.to.re "\u{34}")  (re.++  (str.to.re "\u{35}") (re.++  (str.to.re "\u{30}") (re.++  (str.to.re "\u{35}")  (str.to.re "\u{30}")))))  (str.to.re "\u{30}"))) )  (re.union  (str.to.re "\u{31}")  (re.++  (re.union  (str.to.re "\u{33}")  (re.++  (str.to.re "\u{35}") (re.++  (str.to.re "\u{30}")  (re.union  (str.to.re "\u{32}")  (re.++  (str.to.re "\u{34}")  (str.to.re "\u{30}"))))))  (str.to.re "\u{30}")))))) )) (re.+  (re.union  (str.to.re "\u{32}")  (re.++  (str.to.re "\u{34}") (re.++  (re.union  (str.to.re "\u{32}")  (re.++  (str.to.re "\u{34}")  (str.to.re "\u{30}")))  (str.to.re "\u{30}")))) )  (re.++  (str.to.re "\u{34}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)