tabella_esempio <- function() {
  tint <- 
    c(1.73, 1.35, 0.71, 0.62, 14.28, 0.70, 15.52, 3.15, 0.76, 1.00, 0.50)
  tserv <-
    c(2.90, 1.76, 3.39, 4.52, 4.46, 4.36, 2.09, 3.36, 2.37, 5.38, 0.50)
  n <- length(tint)
  
  a <- numeric(n)  # vettore dei tempi di arrivo
  p <- numeric(n)  # vettore dei tempi di partenza
  
  a[1] <- tint[1]
  p[1] <- a[1] + tserv[1]
  
  df<-data.frame(T = 1:n, S = 1:n, A = 1:n, U = 1:n, Q = 1:n, W = 1:n)
  row.names(df) <- 1:n
  
  df[1,1] <- tint[1]
  df[1,2] <- tserv[1]
  df[1,3] <- a[1]
  df[1,4] <- p[1]
  df[1,5] <- 0
  df[1,6] <- tserv[1]
  
  for (i in 2:n) {
    a[i] <- a[i-1] + tint[i]
    p[i] <- max(a[i], p[i-1]) + tserv[i]
    
    df[i,1] <- tint[i]
    df[i,2] <- tserv[i]
    df[i,3] <- a[i]
    df[i,4] <- p[i]
    df[i,5] <- round(p[i] - a[i] - tserv[i], 4)
    df[i,6] <- round(p[i] - a[i], 4)
  }
  
  return(df)
}
# attesa <- tabella ()[ ,3]
# attesa

# tc <-40
# Narrivi <-max ( which ( attesa <tc ))
# Narrivi

# Le funzioni apply(X,2,mean), apply(X,2,var) e apply(X,2,sd)
# permettono di calcolare la media campionaria, la varianza
# campionaria e la deviazione standard
# campionaria delle colonne di un data frame X. 