(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+ (re.comp  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{22}") (re.union  (str.to.re "\u{27}")  (str.to.re "\u{3d}"))))) ) (re.+ (re.comp  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))) ))  (re.++ (re.+ (re.comp  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{22}") (re.union  (str.to.re "\u{27}")  (str.to.re "\u{3d}"))))) ) (re.++ (re.opt  (re.union  (str.to.re "\u{20}")  (str.to.re "\u{3d}")) ) (re.+ (re.comp  (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2d}") (re.union  (str.to.re "\u{22}")  (str.to.re "\u{27}"))))) ))) )))
(check-sat)
(get-model)