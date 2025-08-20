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

# Esempio: generiamo 30 valori da Exp(λ = 2) con seme = 3
set.seed(3)
round(expsim(30, 2), 3)


# --- Confronto con la funzione predefinita rexp ---
# In R è disponibile la funzione rexp(n, rate = λ),
# che utilizza lo stesso metodo.
# Con lo stesso seme, i risultati coincidono.

set.seed(3)
round(rexp(30, rate = 2), 3)