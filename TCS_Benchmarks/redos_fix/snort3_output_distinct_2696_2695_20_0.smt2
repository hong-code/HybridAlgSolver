(set-logic QF_S)
(declare-const x String)
(assert (str.in.re x (re.inter  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ))  (re.++ (re.+ (re.union (re.range "\u{09}" "\u{0d}") (re.range "\u{20}" "\u{20}") (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")) ) (re.++  (re.++ (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) )  (re.++  (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))) (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))) (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))) (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}"))))))))))  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))))))) (re.*  (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))) (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))) (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))) (re.++  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}"))))))))))  (re.union (re.range "\u{42}" "\u{44}") (re.union (re.range "\u{46}" "\u{48}") (re.union (re.range "\u{4a}" "\u{4e}") (re.union (re.range "\u{50}" "\u{54}") (re.union (re.range "\u{56}" "\u{5a}") (re.union (re.range "\u{62}" "\u{64}") (re.union (re.range "\u{66}" "\u{68}") (re.union (re.range "\u{6a}" "\u{6e}") (re.union (re.range "\u{70}" "\u{74}") (re.range "\u{76}" "\u{7a}")))))))))))))) ))) (re.* (re.comp  (re.union  (str.to_re "\u{0A}")  (str.to_re "\u{0D}"))) ))) )))
(check-sat)
(get-model)