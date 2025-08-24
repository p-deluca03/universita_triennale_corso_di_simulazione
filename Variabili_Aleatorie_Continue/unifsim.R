# Funzione unifsim: genera una sequenza di numeri uniformi in (a, b)
# Parametri:
# - n : numero di valori da generare
# - a : estremo inferiore dell’intervallo
# - b : estremo superiore dell’intervallo
#
# Metodo:
# Si parte da runif(n), che genera numeri uniformi in (0,1).
# Con la trasformazione lineare a + (b - a) * runif(n)
# si ottengono numeri distribuiti uniformemente in (a, b).

unifsim <- function(n, a, b) {
  x <- a + (b - a) * runif(n)
  return(x)
}