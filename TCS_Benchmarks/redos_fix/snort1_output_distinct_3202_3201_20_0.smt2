(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to_re "\u{0A}")) ) (re.* (re.comp  (str.to_re "\u{0A}")) ))  (re.++ (re.* (re.comp  (str.to_re "\u{0A}")) ) (re.++  (re.++ (re.+ (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")) )  (str.to.re "\u{2c}")) (re.* (re.comp  (str.to_re "\u{0A}")) ))) )))
(check-sat)
(get-model)