(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{44}")  (str.to.re "\u{45}"))))))) (re.union  (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{49}") (re.++  (str.to.re "\u{43}")  (str.to.re "\u{54}")))))))) (re.union  (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{49}") (re.++  (str.to.re "\u{4f}")  (str.to.re "\u{4e}")))))))))  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4c}")  (str.to.re "\u{54}")))))))))))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{44}")  (str.to.re "\u{45}"))))))) (re.union  (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{49}") (re.++  (str.to.re "\u{43}")  (str.to.re "\u{54}")))))))) (re.union  (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{49}") (re.++  (str.to.re "\u{4f}")  (str.to.re "\u{4e}")))))))))  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4c}")  (str.to.re "\u{4c}"))))))))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{44}")  (str.to.re "\u{45}"))))))) (re.union  (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{49}") (re.++  (str.to.re "\u{43}")  (str.to.re "\u{54}")))))))) (re.union  (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{49}") (re.++  (str.to.re "\u{4f}")  (str.to.re "\u{4e}")))))))))  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{20}") (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4c}")  (str.to.re "\u{54}")))))))))))))) )  (re.++  (str.to.re "\u{53}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)