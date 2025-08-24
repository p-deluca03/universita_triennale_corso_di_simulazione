# Esempio di utilizzo:
set.seed(5)                               # fisso il seme
x <- geomsim(1000, 0.6)      # 1000 variabili geometriche con p = 0.6
mean(x)                                   # media campionaria ≈ 1.669

# Nota:
# La media teorica di una Geom(p) modificata è 1/p = 1/0.6 = 1.666...
# Qui la media simulata (1.669) è molto vicina a quella teorica.


# --- Funzione predefinita in R ---
# R mette a disposizione rgeom(n, prob) che genera n osservazioni
# da una distribuzione geometrica standard (conteggio dei fallimenti)
# Per ottenere la versione modificata
# (conteggio inclusivo del successo), basta sommare 1.

# Esempio: simuliamo 20 tempi di attesa con p = 0.2
sim <- rgeom(20, prob = 0.2) + 1
sim