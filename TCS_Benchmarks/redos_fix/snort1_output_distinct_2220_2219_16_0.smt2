(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++  (re.union  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}"))))))))) (re.union  (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}"))  (re.union  (str.to.re "\u{78}")  (str.to.re "\u{58}")))))) (re.union  (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}"))  (re.union  (str.to.re "\u{64}")  (str.to.re "\u{44}"))))))))) (re.union  (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{61}")  (str.to.re "\u{41}")) (re.++  (re.union  (str.to.re "\u{6d}")  (str.to.re "\u{4d}")) (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (str.to.re "\u{20}") (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}"))  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))))))))))))  (re.++  (re.union  (str.to.re "\u{66}")  (str.to.re "\u{46}")) (re.++  (re.union  (str.to.re "\u{75}")  (str.to.re "\u{55}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (str.to.re "\u{20}") (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{78}")  (str.to.re "\u{58}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (str.to.re "\u{20}") (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (re.union  (str.to.re "\u{61}")  (str.to.re "\u{41}")) (re.++  (re.union  (str.to.re "\u{72}")  (str.to.re "\u{52}")) (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (re.union  (str.to.re "\u{68}")  (str.to.re "\u{48}")) (re.++  (str.to.re "\u{20}") (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}")) (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (re.union  (str.to.re "\u{70}")  (str.to.re "\u{50}")) (re.++  (str.to.re "\u{20}") (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{73}")  (str.to.re "\u{53}"))  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}"))))))))))))))))))))))))))))))) (re.++  (str.to.re "\u{20}") (re.++  (re.union  (str.to.re "\u{66}")  (str.to.re "\u{46}")) (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (re.union  (str.to.re "\u{6c}")  (str.to.re "\u{4c}")) (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )  (str.to.re "\u{3d}"))))))))  (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.++ (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )))
(check-sat)
(get-model)