(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6b}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{20}") (re.++ (re.* (re.comp  (str.to_re "\u{0D}")) ) (re.++  (str.to_re "\u{0D}")  (str.to_re "\u{0A}"))))))))))) )  (re.++ (re.*  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6b}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{20}") (re.++ (re.* (re.comp  (str.to_re "\u{0D}")) ) (re.++  (str.to_re "\u{0D}")  (str.to_re "\u{0A}"))))))))))) ) (re.++ (re.opt  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6b}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{32}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{20}") (re.++ (re.* (re.comp  (str.to_re "\u{0D}")) ) (re.++  (str.to_re "\u{0D}")  (str.to_re "\u{0A}")))))))))))) ) (re.*  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6b}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{20}") (re.++ (re.* (re.comp  (str.to_re "\u{0D}")) ) (re.++  (str.to_re "\u{0D}")  (str.to_re "\u{0A}"))))))))))) ))) (re.*  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6f}") (re.++  (str.to.re "\u{6b}") (re.++  (str.to.re "\u{69}") (re.++  (str.to.re "\u{65}") (re.++  (str.to.re "\u{3a}") (re.++  (str.to.re "\u{20}") (re.++ (re.* (re.comp  (str.to_re "\u{0D}")) ) (re.++  (str.to_re "\u{0D}")  (str.to_re "\u{0A}"))))))))))) ) )))
(check-sat)
(get-model)