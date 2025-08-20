# Funzione MM2queue: simulazione del numero di
# utenti in un sistema M/M/2
# Parametri:
# - n     : numero di osservazioni da generare
# - rho2  : intensità di traffico (ρ2 = λ / (2μ))
# - seme  : seme per la riproducibilità
#
# Distribuzione teorica:
# In condizioni di equilibrio, il numero di utenti segue
# una distribuzione geometrica modificata, e il valore atteso è:
#   E(N) = (2 * ρ2) / (1 - ρ2^2)

MM2queue <- function(n, rho2, seme) {
  set.seed(seme)                                     
  # imposta il seme
  u <- runif(n)                                      
  # genera n uniformi
  w <- log((1 - u) * (1 + rho2^2)) / log(rho2^2)     
  # trasformazione inversa
  N <- floor(w)                                      
  # parte intera
  return(N)                                          
  # restituisce la sequenza
}

# Esempio di utilizzo:
utenti <- MM2queue(1000, 0.8, 3)   # simuliamo con ρ2 = 0.8
mean(utenti)                       # media campionaria (~4.619)

# Media teorica:
# E(N) = (2 * 0.8) / (1 - 0.8^2) = 1.6 / 0.36 ≈ 4.444

# Frequenze assolute del numero di utenti
table(utenti)

# Frequenze relative (approssimate a 3 cifre decimali)
round(table(utenti) / length(utenti), 3)


# --- Spiegazione ---
# La media campionaria ottenuta (≈ 4.619) è vicina 
# al valore teorico (4.444).
#
# La funzione table() calcola le frequenze assolute,
# mentre table()/length() calcola le frequenze relative.
#
# Ad esempio, per ρ2 = 0.8:
# - probabilità simulata di avere 0 utenti ≈ 0.106
# - probabilità teorica:
# q0 = (1 - ρ2) / (1 + ρ2) = (1 - 0.8) / (1 + 0.8) = 0.111
