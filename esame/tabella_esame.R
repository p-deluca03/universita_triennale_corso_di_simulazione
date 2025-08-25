tabella_esame<- function(n, lambda, mu, seme = NULL) {
  if (!is.null(seme)) set.seed(seme)
  
  # Genero interarrivi e servizi
  interarrivi <- rexp(n, rate = lambda)
  servizi     <- rexp(n, rate = mu)
  
  # Forzo il primo interarrivo a 0
  T <- c(0, interarrivi[-1])
  
  # Arrivi e partenze
  arrivi    <- cumsum(interarrivi)   # tempi assoluti di arrivo
  partenze  <- numeric(n)            # tempi assoluti di partenza
  
  # Primo cliente
  partenze[1] <- arrivi[1] + servizi[1]
  Q <- numeric(n); W <- numeric(n)
  Q[1] <- 0; W[1] <- servizi[1]
  
  # Altri clienti
  for (i in 2:n) {
    partenze[i] <- max(arrivi[i], partenze[i-1]) + servizi[i]
    W[i] <- partenze[i] - arrivi[i]
    Q[i] <- W[i] - servizi[i]
  }
  
  # Data frame finale
  df <- data.frame(
    T = T,
    S = servizi,
    A = arrivi,
    U = partenze,
    Q = Q,
    W = W
  )
  
  return(df)
}