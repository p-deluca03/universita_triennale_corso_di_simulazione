# Esempio: generiamo 50 osservazioni da una Binomiale(20, 0.2)
sim <- rbinom(50, size = 20, prob = 0.2)
sim

# Nota:
# Per ottenere sempre la stessa sequenza,
# occorre fissare il seme del generatore:
set.seed(123) # imposta il seme
sim <- rbinom(50, size = 20, prob = 0.2)
sim