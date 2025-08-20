# Funzione bernsim: generatore di variabili di Bernoulli
# Parametri:
# - n : numero di valori da generare
# - p : probabilità di successo (valore 1)
#
# Funzionamento:
# 1. Si generano n numeri uniformi u ~ U(0,1).
# 2. Gli indici di u con valori < (1 - p) vengono sostituiti con 0.
# 3. Gli indici di u con valori >= (1 - p) vengono sostituiti con 1.
# Risultato: vettore di n valori 0/1 distribuiti secondo Bernoulli(p)

bernsim <- function(n, p) {
  u <- runif(n)                  # genera n numeri uniformi in (0,1)
  u[which(u < 1 - p)] <- 0       # assegna 0 ai valori < (1-p)
  u[which(u >= 1 - p)] <- 1      # assegna 1 ai valori >= (1-p)
  return(u)                      # restituisce la sequenza simulata
}

# Esempio di utilizzo:
set.seed(1)          # fissiamo il seme per avere riproducibilità
bernsim(30, 0.5)                 # 30 prove Bernoulli con p = 0.5


# --- Alternativa con la funzione predefinita sample() di R ---
# Sintassi generale:
#   sample(x, size, replace = FALSE, prob = NULL)
#
# - x  : vettore di valori distinti presi dalla variabile discreta X
# - size   : lunghezza della sequenza generata
# - replace: TRUE per estrazioni con reinserimento, FALSE altrimenti
# - prob   : distribuzione di probabilità associata a X
#
# Se prob non è specificato, si usa la distribuzione equiprobabile.

# Esempi:
# Bernoulli con p = 1/2 (equivalente a prob. equiprobabili)
sample(c(0, 1), 30, replace = TRUE, prob = c(1/2, 1/2))
sample(0:1, 30, replace = TRUE)   # forma abbreviata

# Bernoulli con p = 3/4
sample(c(0, 1), 30, replace = TRUE, prob = c(1/4, 3/4))

# Nota: senza set.seed(seme), la sequenza cambia a ogni esecuzione.
