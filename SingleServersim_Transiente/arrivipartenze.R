# Funzione arrivipartenze per simulare un sistema M/M/1
# Parametri:
# n     = numero di utenti da simulare
# lambda= parametro della distribuzione esponenziale degli arrivi
# mu = param della distribuzione esponenziale dei tempi di servizio
# seme  = seme iniziale per la generazione casuale
# Output:
#   Data frame con due colonne:
#     t_A = tempi di arrivo degli utenti
#     t_P = tempi di partenza (uscita dal sistema) degli utenti

arrivipartenze <- function(n, lambda, mu, seme) {
  
  # Scelta del primo seme e generazione dei tempi tra arrivi
  set.seed(seme)
  u <- runif(n)   # numeri casuali uniformi
  
  # Scelta di un diverso seme e generazione dei tempi di servizio
  set.seed(seme + 2)
  v <- runif(n)   # numeri casuali uniformi
  
  # Vettori per tempi di arrivo (a) e tempi di partenza (p)
  a <- numeric(n)
  p <- numeric(n)
  
  # Calcolo del primo tempo di arrivo e di partenza
  a[1] <- -log(1 - u[1]) / lambda
  p[1] <- a[1] - log(1 - v[1]) / mu
  
  # Creiamo il data frame da riempire
  df <- data.frame(t_A = 1:n, t_P = 1:n)
  row.names(df) <- 1:n
  df[1, 1] <- a[1]
  df[1, 2] <- p[1]
  
  # Calcolo iterativo per i successivi utenti
  for (i in 2:n) {
    # Tempo di arrivo = arrivo precedente + tempo inter-arrivo
    a[i] <- a[i-1] - log(1 - u[i]) / lambda
    
    # Tempo di partenza =
    # max(arrivo, partenza precedente) + tempo di servizio
    p[i] <- max(a[i], p[i-1]) - log(1 - v[i]) / mu
    
    # Aggiorna il data frame
    df[i, 1] <- a[i]
    df[i, 2] <- p[i]
  }
  
  return(df)
}

# ============================
# ESEMPIO DI UTILIZZO
# ============================

# Parametri: n=10 utenti, λ=2, μ=4, seme=3
risultato <- arrivipartenze(10, 2, 4, 3)

# Visualizziamo i risultati
print(risultato)

# ============================
# OSSERVAZIONE TEORICA
# ============================

# Avendo scelto λ = 2 e μ = 4, il sistema M/M/1 non si congestiona
# al crescere del tempo poiché il coefficiente di utilizzazione è:
#     ρ = λ / μ = 2 / 4 = 1/2 = 0.5
# Essendo ρ < 1, il sistema è stabile e non esplode.