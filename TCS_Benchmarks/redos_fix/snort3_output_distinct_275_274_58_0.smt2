(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ))  (re.++ (re.*  (re.union (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ) (re.++  (re.++ (re.+  (re.++ (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))  (str.to.re "\u{00}")) ) (re.++ (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ) (re.++  (str.to.re "\u{3d}") (re.++  (str.to.re "\u{00}") (re.++ (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ) (re.++  (re.union  (str.to.re "\u{6e}")  (str.to.re "\u{4e}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{77}")  (str.to.re "\u{57}")) (re.++  (str.to.re "\u{00}") (re.++ (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ) (re.++  (re.union  (str.to.re "\u{61}")  (str.to.re "\u{41}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{69}")  (str.to.re "\u{49}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{76}")  (str.to.re "\u{56}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{78}")  (str.to.re "\u{58}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{6f}")  (str.to.re "\u{4f}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{62}")  (str.to.re "\u{42}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{6a}")  (str.to.re "\u{4a}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{65}")  (str.to.re "\u{45}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{63}")  (str.to.re "\u{43}")) (re.++  (str.to.re "\u{00}") (re.++  (re.union  (str.to.re "\u{74}")  (str.to.re "\u{54}")) (re.++  (str.to.re "\u{00}") (re.++ (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ) (re.++  (str.to.re "\u{28}") (re.++  (str.to.re "\u{00}") (re.++ (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ) (re.+ (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")) ))))))))))))))))))))))))))))))))))))))))))) (re.*  (re.++ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{00}")) ))) )))
(check-sat)
(get-model)