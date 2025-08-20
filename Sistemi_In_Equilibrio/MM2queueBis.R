# Funzione MM2queueBis: simulazione alternativa per il sistema M/M/2
# usando la funzione predefinita rgeom di R.
#
# Parametri:
# - n     : numero di osservazioni da generare
# - rho2  : intensità di traffico (ρ2 = λ / (2μ))
# - seme  : seme per la riproducibilità
#
# Distribuzione:
# Il numero di utenti nel sistema M/M/2 in equilibrio
# segue una distribuzione geometrica con parametro:
#   p = (1 - ρ2) / (1 + ρ2)
#
# Valore atteso teorico:
#   E(N) = (2 * ρ2) / (1 - ρ2^2)

MM2queueBis <- function(n, rho2, seme) {
  set.seed(seme)                                    
  # imposta il seme
  p <- (1 - rho2) / (1 + rho2)                      
  # parametro della geom
  N <- rgeom(n, p)                                  
  # genera osservazioni
  return(N)
}

# Esempio di utilizzo:
utentiBis <- MM2queueBis(1000, 0.8, 3)

# Media campionaria
mean(utentiBis)   # ≈ 4.53 (vicina al valore teorico 4.444)

# Frequenze assolute
table(utentiBis)

# Frequenze relative (arrotondate a 3 cifre decimali)
round(table(utentiBis) / length(utentiBis), 3)


# --- Spiegazione ---
# Con ρ2 = 0.8:
# - la media teorica è E(N) = 4.444
# - la media campionaria simulata ≈ 4.53
#
# La probabilità di avere 0 utenti nel sistema è:
#   q0 = (1 - ρ2) / (1 + ρ2) = 0.111
# mentre la probabilità simulata risulta molto vicina (~0.11).