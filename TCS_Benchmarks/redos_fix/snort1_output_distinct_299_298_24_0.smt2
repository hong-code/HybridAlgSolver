(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) )  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))  (re.++ (re.* (re.comp  (str.to.re "\u{3e}")) ) (re.++  (re.++  (str.to.re "\u{2f}") (re.++  (str.to.re "\u{2f}") (re.++  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))) (re.++  (str.to.re "\u{2e}") (re.++  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))) (re.++  (str.to.re "\u{2e}") (re.++  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}")))))  (str.to.re "\u{2e}"))))))))  (re.union  (re.range "\u{30}" "\u{39}") (re.union  (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))  (re.++ (re.range "\u{30}" "\u{39}")   (re.++ (re.range "\u{30}" "\u{39}")   (re.range "\u{30}" "\u{39}"))))))) )))
(check-sat)
(get-model)