# Funzione Ugcmm:
# Generatore congruenziale lineare misto (versione normalizzata)
# Parametri:
# - N : numero di valori da generare
# - x0: seme iniziale
# - a : costante moltiplicativa
# - b : costante additiva
# - m : modulo
#
# Formula ricorrente:
#   x_(n+1) = (a * x_n + b) mod m
#
# A differenza della versione gcmm, qui il risultato finale
# viene normalizzato dividendo ogni elemento per m,
# in modo da ottenere numeri pseudocasuali reali
# nell’intervallo [0,1).

Ugcmm <- function(N, x0, a, b, m) {
  n <- N                      # assegna N a n (valori da generare)
  y <- numeric(n + 1)         # crea un vettore num di lunghezza n+1
  y[1] <- x0                  # inizializza il vettore con il seme x0
  for (i in 2:(n + 1)) {      # ciclo che genera i valori
    y[i] <- (a * y[i - 1] + b) %% m   # formula ricorsiva
  }
  y <- y / m                  # normalizzazione in [0,1)
  return(c(y))                # restituisce il vettore dei valori
}