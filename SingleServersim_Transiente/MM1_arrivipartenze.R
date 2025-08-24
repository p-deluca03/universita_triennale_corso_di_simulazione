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