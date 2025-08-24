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