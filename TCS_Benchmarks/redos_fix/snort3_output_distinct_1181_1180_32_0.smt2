(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{7d}")) )  (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}")))))))))))))))  (re.++ (re.* (re.comp  (str.to.re "\u{7d}")) ) (re.++  (re.++  (str.to.re "\u{5c}") (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{76}")  (str.to.re "\u{56}")) (re.++ (re.* (re.comp  (str.to.re "\u{7d}")) ) (re.++ (re.opt (re.+ (re.range "\u{30}" "\u{39}") ) ) (re.++  (str.to.re "\u{3b}") (re.++ (re.opt (re.+ (re.range "\u{30}" "\u{39}") ) )  (str.to.re "\u{3b}"))))))))  (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}"))) (re.comp  (re.union  (str.to.re "\u{3b}")  (str.to.re "\u{7d}")))))))))))))))) )))
(check-sat)
(get-model)