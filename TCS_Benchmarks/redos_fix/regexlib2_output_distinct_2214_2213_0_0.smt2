(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.union (re.*  (re.union  (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.comp  (str.to.re "\u{22}")) )  (str.to.re "\u{22}")))  (re.++  (str.to.re "\u{27}") (re.++ (re.* (re.comp  (str.to.re "\u{27}")) )  (str.to.re "\u{27}")))) ) (re.comp  (re.union  (str.to.re "\u{22}") (re.union  (str.to.re "\u{27}")  (str.to.re "\u{3e}"))))) ) (re.*  (re.union  (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.comp  (str.to.re "\u{22}")) )  (str.to.re "\u{22}")))  (re.++  (str.to.re "\u{27}") (re.++ (re.* (re.comp  (str.to.re "\u{27}")) )  (str.to.re "\u{27}")))) ) )))
(check-sat)
(get-model)