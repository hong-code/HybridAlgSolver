(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (str.to.re "\u{61}") (re.union (re.range "\u{00}" "\u{26}") (re.union  (str.to.re "\u{25}") (re.union  (str.to.re "\u{26}") (re.union  (str.to.re "\u{27}") (re.union  (str.to.re "\u{24}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{28}") (re.union  (str.to.re "\u{6d}") (re.union  (str.to.re "\u{29}") (re.union  (str.to.re "\u{2a}") (re.union  (str.to.re "\u{6f}") (re.union  (str.to.re "\u{2b}") (re.union  (str.to.re "\u{70}") (re.union  (str.to.re "\u{71}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{2f}") (re.union  (str.to.re "\u{74}") (re.union  (str.to.re "\u{75}") (re.union  (str.to.re "\u{3b}") (re.union (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))  (str.to.re "\u{3a}")))))))))))))))))))))) ) (re.+  (re.++ (re.*  (str.to.re "\u{2d}") ) (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{2e}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.*  (str.to.re "\u{25}") ))))) )) (re.+  (re.++ (re.*  (str.to.re "\u{2d}") ) (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{2e}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.*  (str.to.re "\u{25}") ))))) )  (re.++  (str.to.re "\u{2d}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)