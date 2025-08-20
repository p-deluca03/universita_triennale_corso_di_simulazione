# Funzione gcmm: generatore congruenziale lineare misto
# Parametri:
# - N : numero di valori da generare
# - x0: seme iniziale
# - a : costante moltiplicativa
# - c : costante additiva
# - m : modulo
#
# Formula ricorrente:
#   x_(n+1) = (a * x_n + c) mod m
#
# Questo metodo è una generalizzazione del generatore congruenziale 
# moltiplicativo: l’aggiunta di c (costante additiva) migliora
# le proprietà statistiche del generatore.

gcmm <- function(N, x0, a, c, m) {
  n <- N                     # assegna N a n (numero di iterazioni)
  y <- numeric(n + 1)        # crea un vettore numerico lungo n+1
  y[1] <- x0                 # assegna il seme alla prima posizione
  for (i in 2:(n + 1)) {   # ciclo per calcolare i valori successivi
    y[i] <- (a * y[i - 1] + c) %% m   # applica la formula ricorsiva
  }
  return(c(y))          # restituisce il vettore dei valori generati
}