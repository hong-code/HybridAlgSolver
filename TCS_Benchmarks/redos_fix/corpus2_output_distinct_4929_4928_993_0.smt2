(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter (re.*  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{3a}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))) ) (re.opt  (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3d}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )  (re.union  (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.comp  (str.to.re "\u{22}")) )  (str.to.re "\u{22}"))) (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.* (re.comp  (str.to.re "\u{27}")) )  (str.to.re "\u{27}"))) (re.+ (re.comp  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{3e}"))) )))))) ))) )  (re.++ (re.*  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++ (re.+  (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{3a}") (re.union (re.range "\u{30}" "\u{39}") (re.range "\u{41}" "\u{5a}") (re.range "\u{5f}" "\u{5f}") (re.range "\u{61}" "\u{7a}") (re.range "\u{aa}" "\u{aa}") (re.range "\u{b5}" "\u{b5}") (re.range "\u{ba}" "\u{ba}") (re.range "\u{c0}" "\u{d6}") (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))) ) (re.opt  (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (str.to.re "\u{3d}") (re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )  (re.union  (re.++  (str.to.re "\u{22}") (re.++ (re.* (re.comp  (str.to.re "\u{22}")) )  (str.to.re "\u{22}"))) (re.union  (re.++  (str.to.re "\u{27}") (re.++ (re.* (re.comp  (str.to.re "\u{27}")) )  (str.to.re "\u{27}"))) (re.+ (re.comp  (re.union (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))  (str.to.re "\u{3e}"))) )))))) ))) ) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) )) (re.* (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) )))
(check-sat)
(get-model)