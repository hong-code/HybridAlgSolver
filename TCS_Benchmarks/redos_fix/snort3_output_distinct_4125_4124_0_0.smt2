(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++  (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))))))))))))))))))))) (re.*  (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))))))))))))))))))))) )))  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (str.to.re "\u{2e}")  (re.++  (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))))))))))))))))))))) (re.*  (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.++ (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}")))))))) (re.comp  (re.union  (str.to.re "\u{3b}") (re.union  (str.to_re "\u{0A}") (re.union  (str.to.re "\u{3f}") (re.union  (str.to.re "\u{2e}") (re.union  (str.to_re "\u{0D}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))))))))))))))))))))))) )))) )))
(check-sat)
(get-model)