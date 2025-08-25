# ----------------------------------------------------------
# Funzione: attesa
# Restituisce un data frame con:
#   S = tempi di servizio,
#   Q = tempi di permanenza in coda (attesa "pura"),
#   W = tempo di attesa nel sistema (sojourn time = Q + S).
# ----------------------------------------------------------
MM1_attesa <- function(n, lambda, mu, seme) {
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