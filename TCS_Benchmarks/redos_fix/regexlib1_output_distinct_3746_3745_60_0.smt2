(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.+  (re.union  (re.++ (re.* (re.range "\u{41}" "\u{5a}") )  (re.++ (re.* (re.range "\u{61}" "\u{7a}") ) (re.++ (re.* (re.range "\u{30}" "\u{39}") ) (re.++ (re.*  (str.to.re "\u{25}") ) (re.++ (re.*  (str.to.re "\u{26}") ) (re.++ (re.*  (str.to.re "\u{27}") ) (re.++ (re.*  (str.to.re "\u{2b}") ) (re.++ (re.*  (str.to.re "\u{2d}") ) (re.++ (re.*  (str.to.re "\u{40}") ) (re.++ (re.*  (str.to.re "\u{5f}") ) (re.*  (str.to.re "\u{2e}") )))))))))))  (re.++  (str.to.re "\u{20}") (re.comp  (str.to.re "\u{20}")))) ) (re.*  (str.to.re "\u{2d}") ) )))
(check-sat)
(get-model)