# Funzione MMinfty: simulazione del numero di utenti
# nel sistema M/M/∞
# Parametri:
# - n    : numero di osservazioni da generare
# - rho  : intensità di traffico (ρ = λ/μ)
# - seme : seme per la riproducibilità
#
# Distribuzione teorica:
# In condizioni di equilibrio, il numero di utenti
# segue una distribuzione di Poisson
# con media E(N) = ρ e varianza Var(N) = ρ.

MMinfty <- function(n, rho, seme) {
  set.seed(seme)                     
  # imposto il seme
  N <- rpois(n, rho)                 
  # genero n osservazioni da Poisson(ρ)
  return(N)
}

# --- Esempio 1: ρ = 0.6 ---
utenti <- MMinfty(1000, 0.6, 7)
mean(utenti)  # ≈ 0.601 (media campionaria vicina a E(N) = 0.6)
var(utenti)   # ≈ 0.61  (varianza campionaria vicina a Var(N) = 0.6)

table(utenti)                             # frequenze assolute
table(utenti) / length(utenti)            # frequenze relative

# Teoria:
# E(N) = ρ = 0.6
# q0 = P(N = 0) = e^(-ρ) = e^(-0.6) ≈ 0.5488
# Simulazione: P(N=0) ≈ 0.549 → molto vicino al valore teorico


# --- Esempio 2: ρ = 2 ---
utenti2 <- MMinfty(1000, 2, 7)
mean(utenti2)     # ≈ 2.027 (vicino a E(N) = 2)
var(utenti2)      # ≈ 2.00 (vicino a Var(N) = 2)

table(utenti2)
table(utenti2) / length(utenti2)

# Teoria:
# E(N) = ρ = 2
# q0 = P(N = 0) = e^(-ρ) = e^(-2) ≈ 0.1353
# Simulazione: P(N=0) ≈ 0.130 → molto vicino al valore teorico