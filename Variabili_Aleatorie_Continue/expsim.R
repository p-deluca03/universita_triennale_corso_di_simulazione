# Funzione expsim: genera numeri pseudocasuali
# con distribuzione esponenziale
# Parametri:
# - n      : numero di valori da generare
# - lambda : parametro della distribuzione (tasso, λ)
#
# Metodo:
# Si parte da numeri uniformi u ~ U(0,1).
# Con la trasformazione inversa della funzione di ripartizione:
#   X = -log(1 - U) / λ
# si ottengono numeri distribuiti secondo Exp(λ).
#
# Valore atteso teorico: E(X) = 1/λ

expsim <- function(n, lambda) {
  x <- -log(1 - runif(n)) / lambda
  return(x)
}