(set-logic QF_S)
(declare-const x String)
(check-sat)
(get-model)