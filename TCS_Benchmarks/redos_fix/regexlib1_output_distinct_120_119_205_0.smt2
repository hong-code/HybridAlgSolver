(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.* (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")) ) (re.* (re.comp  (re.union  (str.to.re "\u{71}") (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{75}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{6f}"))))))) ) )))
(check-sat)
(get-model)