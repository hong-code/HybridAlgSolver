(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.comp  (str.to.re "\u{21}")) )  (re.++ (re.* (re.comp  (str.to.re "\u{21}")) ) (re.++ (re.opt  (str.to.re "\u{21}") ) (re.* (re.comp  (str.to.re "\u{40}")) ))) (re.* (re.comp  (str.to.re "\u{40}")) ) )))
(check-sat)
(get-model)