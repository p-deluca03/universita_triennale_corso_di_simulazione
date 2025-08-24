utenti <- MMinfty(1000, 0.6, 7)
mean(utenti)  # ≈ 0.601 (media campionaria vicina a E(N) = 0.6)
var(utenti)   # ≈ 0.61  (varianza campionaria vicina a Var(N) = 0.6)

table(utenti)                             # frequenze assolute
table(utenti) / length(utenti)            # frequenze relative