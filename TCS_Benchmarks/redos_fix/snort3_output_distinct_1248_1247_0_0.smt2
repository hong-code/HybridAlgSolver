(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to_re "\u{0A}")) ) (re.+ (re.range "\u{30}" "\u{39}") ))  (re.++ (re.* (re.comp  (str.to_re "\u{0A}")) ) (re.++  (str.to.re "\u{25}") (re.+ (re.range "\u{30}" "\u{39}") ))) )))
(check-sat)
(get-model)