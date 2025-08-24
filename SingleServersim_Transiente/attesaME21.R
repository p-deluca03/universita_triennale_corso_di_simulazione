############################################################
# Simulazione M/E2/1 — Tempi di servizio Erlang-2
# Restituisce:
#   S = tempi di servizio
#   Q = tempi di attesa in coda
#   W = tempi di attesa nel sistema (Q + S)
#
# Nota teorica (M/G/1 con S ~ Erlang(k=2, rate=2*mu)):
#   E[S]   = 1/mu
#   Var(S) = 1/(2*mu^2)
#   E[S^2] = Var + (E[S])^2 = 3/(2*mu^2)
#   ρ      = λ E[S] = λ/μ
#   E[Q]   = λ E[S^2] / (2(1-ρ)) = 3λ / (4 μ^2 (1-ρ))
#   E[W]   = E[S] + E[Q]
############################################################

attesaME21 <- function(n, lambda, mu, seme) {
  # flusso per inter-arrivi
  set.seed(seme);   u  <- runif(n)
  
  # due flussi indipendenti per l’Erlang-2
  # (somma di due Exp(rate=2*mu))
  set.seed(seme+2); v1 <- runif(n)
  set.seed(seme+3); v2 <- runif(n)
  
  a <- numeric(n)  # arrivi
  p <- numeric(n)  # partenze
  
  # primo cliente
  a[1] <- -log(1 - u[1]) / lambda
  s1   <- -log(1 - v1[1]) / (2*mu) + -log(1 - v2[1]) / (2*mu) 
  # Erlang-2
  p[1] <- a[1] + s1
  
  df <- data.frame(S = numeric(n), Q = numeric(n), W = numeric(n))
  rownames(df) <- 1:n
  df$S[1] <- s1
  df$Q[1] <- 0
  df$W[1] <- s1
  
  # successivi
  for (i in 2:n) {
    a[i] <- a[i-1] - log(1 - u[i]) / lambda
    s_i  <- -log(1 - v1[i]) / (2*mu) + -log(1 - v2[i]) / (2*mu)
    # servizio Erlang-2
    p[i] <- max(a[i], p[i-1]) + s_i
    
    df$S[i] <- s_i
    df$W[i] <- p[i] - a[i]
    df$Q[i] <- df$W[i] - s_i
  }
  
  return(df)
}