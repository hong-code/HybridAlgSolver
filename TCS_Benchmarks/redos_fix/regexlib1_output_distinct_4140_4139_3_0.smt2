(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.*  (re.union  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{27}")) (re.comp  (str.to.re "\u{27}"))) )  (str.to.re "\u{27}"))) (re.comp  (str.to_re "\u{0A}"))) ) (re.+  (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.*  (re.union  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{27}")) (re.comp  (str.to.re "\u{27}"))) )  (str.to.re "\u{27}")))  (re.++  (str.to.re "\u{22}") (re.++ (re.*  (re.union  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{22}")) (re.comp  (str.to.re "\u{22}"))) )  (str.to.re "\u{22}")))) )) (re.+  (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.*  (re.union  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{27}")) (re.comp  (str.to.re "\u{27}"))) )  (str.to.re "\u{27}")))  (re.++  (str.to.re "\u{22}") (re.++ (re.*  (re.union  (re.++  (str.to.re "\u{5c}")  (str.to.re "\u{22}")) (re.comp  (str.to.re "\u{22}"))) )  (str.to.re "\u{22}")))) )  (re.++  (str.to.re "\u{22}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)