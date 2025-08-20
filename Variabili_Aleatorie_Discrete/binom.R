# La funzione rbinom permette di generare numeri pseudocasuali
# da una distribuzione binomiale.
#
# Sintassi:
#   rbinom(n, size, prob)
#
# Parametri:
# - n    : numero di osservazioni da generare
#          (lunghezza della sequenza)
# - size : numero complessivo di prove
#          (ossia k, in ogni esperimento binomiale)
# - prob : probabilità di successo in ciascuna prova
#
# Restituisce una sequenza di lunghezza n contenente
# il numero di successi in ciascun esperimento binomiale.

# Esempio: generiamo 50 osservazioni da una Binomiale(20, 0.2)
sim <- rbinom(50, size = 20, prob = 0.2)
sim

# Nota:
# Per ottenere sempre la stessa sequenza,
# occorre fissare il seme del generatore:
set.seed(123) # imposta il seme
sim <- rbinom(50, size = 20, prob = 0.2)
sim