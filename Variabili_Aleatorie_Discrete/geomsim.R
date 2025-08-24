# Funzione geomsim: simulazione di variabili geometriche modificate
# Parametri:
# - n : numero di osservazioni da generare
# - p : probabilità di successo
#
# Metodo:
# Si genera una sequenza di n numeri uniformi u ~ U(0,1).
# Poi si applica la formula inversa della funzione di ripartizione
# per ottenere variabili geometriche:
#   w = log(1 - u) / log(1 - p) + 1
# Applicando floor(w), otteniamo valori interi.
#
# La distribuzione generata ha valore atteso teorico:
#   E(X) = 1/p

geomsim <- function(n, p) {
  u <- runif(n)                           # genera n numeri uniformi
  w <- log(1 - u) / log(1 - p) + 1        # formula inversa
  y <- floor(w)                           # prende la parte intera
  return(y)
}