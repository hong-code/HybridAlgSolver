(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (str.to.re "\u{2f}") (re.+  (re.union (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")) (re.union (re.range "\u{00}" "\u{2f}") (re.range "\u{3a}" "\u{40}") (re.range "\u{5b}" "\u{5e}") (re.range "\u{60}" "\u{60}") (re.range "\u{7b}" "\u{a9}") (re.range "\u{ab}" "\u{b4}") (re.range "\u{b6}" "\u{b9}") (re.range "\u{bb}" "\u{bf}") (re.range "\u{d7}" "\u{d7}") (re.range "\u{f7}" "\u{f7}"))) ) )))
(check-sat)
(get-model)