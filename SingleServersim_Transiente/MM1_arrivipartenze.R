############################################################
# Simulazione M/M/1 — Arrivi/Partenze e Tempi di Attesa
############################################################

# ----------------------------------------------------------
# Funzione: arrivipartenze
# Restituisce i tempi di arrivo (t_A) e di partenza (t_P)
# per n utenti in un sistema M/M/1.
# ----------------------------------------------------------
arrivipartenze <- function(n, lambda, mu, seme) {
  set.seed(seme);   u <- runif(n)     # inter-arrivi ~ Exp(lambda)
  set.seed(seme+2); v <- runif(n)     # servizi     ~ Exp(mu)
  
  a <- numeric(n)                     # tempi di arrivo
  p <- numeric(n)                     # tempi di partenza
  
  a[1] <- -log(1 - u[1]) / lambda        
  # primo arrivo
  p[1] <- a[1] - log(1 - v[1]) / mu  
  # prima partenza = arrivo + servizio
  
  df <- data.frame(t_A = a, t_P = p)
  
  for (i in 2:n) {
    a[i] <- a[i-1] - log(1 - u[i]) / lambda
    # partenza = max(arrivo, partenza precedente) + servizio
    p[i] <- max(a[i], p[i-1]) - log(1 - v[i]) / mu
    df$t_A[i] <- a[i]
    df$t_P[i] <- p[i]
  }
  
  return(df)
}

# ----------------------------------------------------------
# Funzione: attesa
# Restituisce un data frame con:
#   S = tempi di servizio,
#   Q = tempi di permanenza in coda (attesa "pura"),
#   W = tempo di attesa nel sistema (sojourn time = Q + S).
# ----------------------------------------------------------
attesa <- function(n, lambda, mu, seme) {
  set.seed(seme);   u <- runif(n)        # inter-arrivi
  set.seed(seme+2); v <- runif(n)        # servizi
  
  a <- numeric(n)                        # arrivi
  p <- numeric(n)                        # partenze
  
  a[1] <- -log(1 - u[1]) / lambda
  s1  <- -log(1 - v[1]) / mu             # primo servizio
  p[1] <- a[1] + s1
  
  df <- data.frame(S = numeric(n), Q = numeric(n), W = numeric(n))
  rownames(df) <- 1:n
  df$S[1] <- s1
  df$Q[1] <- 0
  df$W[1] <- s1
  
  for (i in 2:n) {
    a[i] <- a[i-1] - log(1 - u[i]) / lambda
    s_i  <- -log(1 - v[i]) / mu
    p[i] <- max(a[i], p[i-1]) + s_i
    
    df$S[i] <- s_i
    df$W[i] <- p[i] - a[i]               # tempo nel sistema
    df$Q[i] <- df$W[i] - s_i             # solo attesa in coda
  }
  
  return(df)
}

# ============================
# ESEMPIO DI UTILIZZO BASE
# ============================
# n=10, λ=2, μ=4, seme=3:
# il sistema non si congestiona (ρ = λ/μ = 0.5 < 1)
risultato_AP <- arrivipartenze(10, 2, 4, 3)
print(risultato_AP)

# Nota teorica:
# Con λ = 2 e μ = 4, ρ = λ/μ = 0.5:
# il sistema M/M/1 è stabile (non si congestiona).

# ============================
# ESEMPIO: tempi S, Q, W
# ============================
risultato_AQW <- attesa(10, 2, 4, 3)
print(risultato_AQW)

# Teoria in equilibrio per M/M/1 (ρ = λ/μ < 1):
#   E(S) = 1/μ
#   E(W) = 1/(μ - λ)
#   E(Q) = E(W) - E(S) = ρ / (μ - λ)

# ==========================================================
# Tre casi di confronto teorico vs simulazione (campione n=5000)
# ==========================================================

# ---- Caso 1:
# λ=2, μ=4  (ρ=0.5) -> stabile
cm1 <- colMeans(attesa(5000, 2, 4, 3))
print(cm1)  # atteso: E(S)=0.25, E(Q)=0.25, E(W)=0.5

# ---- Caso 2:
# λ=2, μ=6  (ρ≈0.333) -> più veloce del Caso 1, attese minori
cm2 <- colMeans(attesa(5000, 2, 6, 3))
print(cm2) 
# atteso: E(S)=1/6≈0.1667, E(Q)=ρ/(μ-λ)= (2/6)/(4)≈0.0833, E(W)≈0.25

# ---- Caso 3:
# λ=2, μ=1  (ρ=2) -> instabile: coda esplode (congestione)
cm3 <- colMeans(attesa(5000, 2, 1, 3))
print(cm3)

# Osservazione per μ=1:
# Poiché ρ = λ/μ = 2 > 1, M/M/1 è destinato a congestionarsi:
# i tempi medi crescono.
# Per evitare congestione in M/M/s, serve un numero s
# di server tale che:
#     s - 1 < λ/μ < s
# Con λ=2 e μ=1, occorrono s=3 server paralleli
# per non congestionare.