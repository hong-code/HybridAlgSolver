(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.* (re.comp  (re.union  (str.to.re "\u{2f}")  (str.to.re "\u{3e}"))) ))  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.* (re.comp  (re.union  (str.to.re "\u{2f}")  (str.to.re "\u{3e}"))) )) )))
(check-sat)
(get-model)