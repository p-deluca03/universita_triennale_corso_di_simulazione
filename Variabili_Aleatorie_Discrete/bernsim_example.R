# Esempi:
# Bernoulli con p = 1/2 (equivalente a prob. equiprobabili)
sample(c(0, 1), 30, replace = TRUE, prob = c(1/2, 1/2))
sample(0:1, 30, replace = TRUE)   # forma abbreviata

# Bernoulli con p = 3/4
sample(c(0, 1), 30, replace = TRUE, prob = c(1/4, 3/4))

# Nota: senza set.seed(seme), la sequenza cambia a ogni esecuzione.