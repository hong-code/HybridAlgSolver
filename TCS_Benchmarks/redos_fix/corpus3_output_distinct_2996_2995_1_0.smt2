(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++  (re.union (str.to_re "") (re.union  (re.++  (re.++ (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) )  (str.to.re "\u{2f}"))  (str.to_re ""))  (re.++  (re.++ (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) )  (str.to.re "\u{2f}"))   (re.++  (re.++ (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) )  (str.to.re "\u{2f}"))  (str.to_re ""))))) (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) ))  (re.++  (re.union (str.to_re "") (re.union  (re.++  (re.++ (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) )  (str.to.re "\u{2f}"))  (str.to_re ""))  (re.++  (re.++ (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) )  (str.to.re "\u{2f}"))   (re.++  (re.++ (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) )  (str.to.re "\u{2f}"))  (str.to_re ""))))) (re.+  (re.union (re.range "\u{61}" "\u{7a}")  (str.to.re "\u{5f}")) )) )))
(check-sat)
(get-model)