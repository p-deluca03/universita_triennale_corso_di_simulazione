# La funzione gcm genera una sequenza di numeri pseudocasuali.
# I parametri sono:
# - N: la quantità di numeri da generare,
# - x0: il seme iniziale,
# - a: la costante moltiplicativa,
# - m: il modulo del generatore.
#
# Viene creato un vettore numerico y di lunghezza N+1,
# il cui primo elemento è il seme iniziale x0.
# Ad ogni passo del ciclo for, l’elemento successivo y[i]
# viene calcolato come il resto della divisione intera di
# <(a * y[i-1]) per m,
# utilizzando l’operatore %% di R.
#
# La funzione restituisce l’intero vettore y
# (concatenato con c()), che rappresenta la sequenza di numeri
# pseudocasuali generata.

gcm <- function(N, x0, a, m) {
  n <- N
  y <- numeric(n + 1)
  y[1] <- x0
  for (i in 2:(n + 1)) {
    y[i] <- (a * y[i - 1]) %% m
  }
  return(c(y))
}