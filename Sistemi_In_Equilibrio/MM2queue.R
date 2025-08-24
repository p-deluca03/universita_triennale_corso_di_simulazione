# Funzione MM2queue: simulazione del numero di
# utenti in un sistema M/M/2
# Parametri:
# - n     : numero di osservazioni da generare
# - rho2  : intensità di traffico (ρ2 = λ / (2μ))
# - seme  : seme per la riproducibilità
#
# Distribuzione teorica:
# In condizioni di equilibrio, il numero di utenti segue
# una distribuzione geometrica modificata, e il valore atteso è:
#   E(N) = (2 * ρ2) / (1 - ρ2^2)

MM2queue <- function(n, rho2, seme) {
  set.seed(seme)                                     
  # imposta il seme
  u <- runif(n)                                      
  # genera n uniformi
  w <- log((1 - u) * (1 + rho2^2)) / log(rho2^2)     
  # trasformazione inversa
  N <- floor(w)                                      
  # parte intera
  return(N)                                          
  # restituisce la sequenza
}