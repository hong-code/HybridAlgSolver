(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.*  (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))) )  (re.union  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))   (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))))  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))   (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))   (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))))))))  (re.++  (re.*  (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))) ) (re.++  (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (str.to.re "\u{2e}") (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}")) (re.++  (re.*  (re.union  (str.to.re "\u{2e}") (re.union (re.range "\u{30}" "\u{39}") (re.union  (str.to.re "\u{2d}") (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}"))))) ) (re.++  (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{61}" "\u{7a}"))  (str.to.re "\u{2e}"))))))  (re.union  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))) (re.union  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))   (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))))  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))   (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))   (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{6e}"))))))))) )))
(check-sat)
(get-model)