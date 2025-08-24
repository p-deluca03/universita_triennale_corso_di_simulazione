## Funzione arrivi()
## ----------------
## Genera una sequenza di tempi di arrivo
## secondo un processo di Poisson
## con tempi di interarrivo esponenziali di parametro λ.
##
## Parametri:
##   n      = numero di arrivi da generare
##   lambda = parametro λ (>0) della distribuzione esponenziale
##   seme   = seme per la generazione casuale
##
## Output:
##   Data frame con:
##     - t_A : tempi di arrivo cumulativi degli utenti
##     - N_A : numero cumulativo degli arrivi fino a ciascun tempo

arrivi <- function(n, lambda, seme) {
  
  set.seed(seme)           # fissiamo il seme per riproducibilità
  u <- runif(n)            # numeri casuali uniformi (0,1)
  a <- numeric(n)          # vettore dei tempi di arrivo
  
  # Primo interarrivo
  a[1] <- -log(1 - u[1]) / lambda
  
  # Creiamo il data frame risultato
  df <- data.frame(t_A = a[1], N_A = 1)
  row.names(df) <- 1:n
  
  # Ciclo per generare i successivi interarrivi
  for (i in 2:n) {
    a[i] <- a[i-1] - log(1 - u[i]) / lambda
    df[i, ] <- c(a[i], i)
  }
  
  return(df)
}