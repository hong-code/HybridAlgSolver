(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (str.to.re "\u{2d}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{5f}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{5f}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{2d}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{5f}") (re.++ (re.+ (re.range "\u{30}" "\u{39}") ) (re.++  (str.to.re "\u{5f}") (re.+ (re.range "\u{30}" "\u{39}") )))))))))))) (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ))) )))
(check-sat)
(get-model)