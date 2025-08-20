# La funzione rpois genera numeri casuali
# da una distribuzione di Poisson.
#
# Sintassi:
#   rpois(n, lambda)
#
# Parametri:
# - n      : numero di osservazioni da generare
# - lambda : valore medio (e varianza) della distribuzione di Poisson
#
# Proprietà teoriche:
# - E(X) = λ
# - Var(X) = λ

# Esempio: simuliamo 100 osservazioni da una Poisson(λ = 3)
set.seed(7)                    # imposto il seme per riproducibilità
sim <- rpois(100, lambda = 3)  # genero 100 valori da Poisson(3)
sim

# Calcolo della media campionaria
mean(sim)   # ≈ 3.08 (vicina al valore teorico 3)

# Calcolo della varianza campionaria
var(sim)    # ≈ 3.33 (vicina al valore teorico 3)


# --- Spiegazione ---
# La media teorica della distribuzione di Poisson è E(X) = λ = 3.
# La media campionaria ottenuta è 3.08 → vicina al valore teorico.
#
# La varianza teorica della distribuzione di Poisson è Var(X) = λ = 3
# La varianza campionaria calcolata dalla simulazione è
# 3.33 → anch’essa vicina a 3.
#
# Differenze tra valori teorici e simulati sono normali e
# dipendono dal campione generato.
#
# Nota: fissare il seme con set.seed()
#       permette di ottenere sempre la stessa sequenza.
