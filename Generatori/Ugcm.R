# La funzione Ugcm genera una sequenza di numeri
# pseudocasuali uniformi nell'intervallo [0,1).
# Parametri:
# - N: la quantità di numeri da generare,
# - x0: il seme iniziale,
# - a: la costante moltiplicativa,
# - m: il modulo del generatore.
#
# Viene creato un vettore numerico y di lunghezza N+1,
# con primo elemento uguale al seme x0.
# Ad ogni iterazione del ciclo for, y[i] viene calcolato come
# (a * y[i-1]) %% m,
# ossia il resto della divisione intera.
#
# Al termine, l’intero vettore y viene normalizzato dividendo per m,
# così da restituire numeri reali compresi tra 0 e 1.
# La funzione ritorna il vettore risultante.

Ugcm <- function(N, x0, a, m) {
  n <- N
  y <- numeric(n + 1)
  y[1] <- x0
  for (i in 2:(n + 1)) {
    y[i] <- (a * y[i - 1]) %% m
  }
  y <- y / m
  return(c(y))
}