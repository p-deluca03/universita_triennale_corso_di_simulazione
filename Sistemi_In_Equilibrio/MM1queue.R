# Funzione MM1queue: sim. del numero di utenti nel sistema M/M/1
# Parametri:
# - n    : lunghezza della sequenza da generare
# - rho  : tasso di utilizzazione (ρ = λ/μ, con λ < μ)
# - seme : seme per il generatore di numeri casuali
#
# Formula usata:
# Si sfrutta la distribuzione geometrica che descrive il numero
# di utenti presenti in un sistema M/M/1 in equilibrio:
#   P(N = k) = (1 - ρ) * ρ^k
# con valore atteso E(N) = ρ / (1 - ρ).

MM1queue <- function(n, rho, seme) {
  set.seed(seme)                           # imposto il seme
  u <- runif(n)                            # genero n numeri uniformi
  w <- log(1 - u) / log(rho)               # trasformazione inversa
  N <- floor(w)                            # prendo la parte intera
  return(N)
}

# Esempio:
utenti <- MM1queue(1000, 0.6, 7)        # simulazione con ρ = 0.6
mean(utenti)                            # media campionaria (~1.525)
table(utenti)                           # frequenze assolute
round(table(utenti)/length(utenti), 3)  # frequenze relative
