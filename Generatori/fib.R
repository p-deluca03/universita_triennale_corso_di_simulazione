# Funzione fib:
# Generatore basato sulla sequenza di Fibonacci modulare
# Parametri:
# - N  : numero di valori da generare
# - x0 : primo seme iniziale
# - x1 : secondo seme iniziale
# - m  : modulo
#
# Formula ricorrente:
#   x_(n) = (x_(n-1) + x_(n-2)) mod m
#
# Questo generatore produce una sequenza simili ai numeri di
# Fibonacci, ma ridotti modulo m, così da mantenerli entro un certo 
# intervallo. Viene usato come alternativa ai generatori
# lineari congruenziali.

fib <- function(N, x0, x1, m) {
  n <- N                       # numero di elementi da generare
  y <- numeric(n + 1)          # inizializza il vettore dei risultati
  y[1] <- x0                   # primo seme
  y[2] <- x1                   # secondo seme
  for (i in 3:(n + 1)) {       # calcolo iterativo
    y[i] <- (y[i - 1] + y[i - 2]) %% m
  }
  return(c(y))                 # restituisce la sequenza
}