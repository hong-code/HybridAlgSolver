(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to.re "\u{3e}")) )  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.union  (str.to.re "\u{22}")  (re.++  (str.to.re "\u{25}") (re.++  (str.to.re "\u{32}")  (str.to.re "\u{32}")))) (re.* (re.comp  (re.union  (str.to.re "\u{3e}")  (str.to.re "\u{22}"))) ))) (re.* (re.comp  (re.union  (str.to.re "\u{3e}")  (str.to.re "\u{22}"))) ) )))
(check-sat)
(get-model)