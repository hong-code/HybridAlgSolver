(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+  (re.union  (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}")  (str.to.re "\u{59}")))))))) (re.union  (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{43}")  (str.to.re "\u{48}"))))) (re.union  (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{49}")  (str.to.re "\u{4c}"))))) (re.union  (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{41}")  (str.to.re "\u{59}"))) (re.union  (re.++  (str.to.re "\u{4a}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4e}")  (str.to.re "\u{45}")))) (re.union  (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{47}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{53}")  (str.to.re "\u{54}")))))) (re.union  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}"))))))))) (re.union  (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}"))))))) (re.union  (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{56}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}")))))))) (re.union  (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}")))))))) (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2f}") (re.union (re.range "\u{30}" "\u{39}")  (re.++  (str.to.re "\u{4a}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4c}")  (str.to.re "\u{59}")))))))))))))))))) ) (re.+  (re.union  (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}")  (str.to.re "\u{59}")))))))) (re.union  (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{43}")  (str.to.re "\u{48}"))))) (re.union  (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{49}")  (str.to.re "\u{4c}"))))) (re.union  (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{41}")  (str.to.re "\u{59}"))) (re.union  (re.++  (str.to.re "\u{4a}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4e}")  (str.to.re "\u{45}")))) (re.union  (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{47}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{53}")  (str.to.re "\u{54}")))))) (re.union  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}"))))))))) (re.union  (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}"))))))) (re.union  (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{56}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}")))))))) (re.union  (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}")))))))) (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2f}") (re.union (re.range "\u{30}" "\u{39}")  (re.++  (str.to.re "\u{4a}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}")  (str.to.re "\u{59}"))))))))))))))))))))) )) (re.+  (re.union  (re.++  (str.to.re "\u{46}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}")  (str.to.re "\u{59}")))))))) (re.union  (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{43}")  (str.to.re "\u{48}"))))) (re.union  (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{52}") (re.++  (str.to.re "\u{49}")  (str.to.re "\u{4c}"))))) (re.union  (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{41}")  (str.to.re "\u{59}"))) (re.union  (re.++  (str.to.re "\u{4a}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{4e}")  (str.to.re "\u{45}")))) (re.union  (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{47}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{53}")  (str.to.re "\u{54}")))))) (re.union  (re.++  (str.to.re "\u{53}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{50}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}"))))))))) (re.union  (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{54}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}"))))))) (re.union  (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{4f}") (re.++  (str.to.re "\u{56}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}")))))))) (re.union  (re.++  (str.to.re "\u{44}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{43}") (re.++  (str.to.re "\u{45}") (re.++  (str.to.re "\u{4d}") (re.++  (str.to.re "\u{42}") (re.++  (str.to.re "\u{45}")  (str.to.re "\u{52}")))))))) (re.union  (str.to.re "\u{20}") (re.union  (str.to.re "\u{2c}") (re.union  (str.to.re "\u{2f}") (re.union (re.range "\u{30}" "\u{39}")  (re.++  (str.to.re "\u{4a}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{4e}") (re.++  (str.to.re "\u{55}") (re.++  (str.to.re "\u{41}") (re.++  (str.to.re "\u{52}")  (str.to.re "\u{59}"))))))))))))))))))))) )  (re.++  (str.to.re "\u{4a}") (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{0c}") (re.range "\u{0e}" "\u{84}") (re.range "\u{86}" "\u{ff}")) )) )))
(check-sat)
(get-model)