tabella <- function() {
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
attesa <- tabella ()[ ,3]
attesa
# [1] 1.73 3.08 3.79 4.41 18.69 19.39 34.91 38.06 38.82 39.82 40.32
tc <-40
Narrivi <-max ( which ( attesa <tc ))
Narrivi
# [1] 10
# Le funzioni apply(X,2,mean), apply(X,2,var) e apply(X,2,sd)
# permettono di calcolare la media campionaria, la varianza
# campionaria e la deviazione standard
# campionaria delle colonne di un data frame X. 
# Per il data frame precedente si ha:

tabella <- function() {
  tint <- 
    c(1.73, 1.35, 0.71, 0.62, 14.28, 0.70, 15.52, 3.15, 0.76, 1.00, 0.50)
  tserv <-
    c(2.90, 1.76, 3.39, 4.52, 4.46, 4.36, 2.09, 3.36, 2.37, 5.38, 0.50)
  n <- length(tint)
  
  a <- numeric(n)  # vettore dei tempi di arrivo
  p <- numeric(n)  # vettore dei tempi di partenza
  
  a[1] <- tint[1]
  p[1] <- a[1] + tserv[1]
  
  df <-
    data.frame(T = 1:n, S = 1:n, A = 1:n, U = 1:n, Q = 1:n, W = 1:n)
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

# Esempio di utilizzo:
Ridottatabella <- tabella()

# Calcolo media, varianza e deviazione standard per colonne
apply(Ridottatabella, 2, mean)
apply(Ridottatabella, 2, var)
apply(Ridottatabella, 2, sd)

############################################################
# Grafico del numero di utenti nel sistema e in coda
# a partire dai tempi di arrivo e partenza
############################################################

# Supponiamo di avere un data frame "Ridottatabella" con:
# - colonna 3 = tempi di arrivo (t_A)
# - colonna 4 = tempi di partenza (t_P)

# Estraiamo i tempi di arrivo e partenza
tempiarrivi    <- Ridottatabella[,3]
tempipartenze  <- Ridottatabella[,4]

# Creiamo un vettore "tempi" che contiene:
#   - 0 (tempo iniziale)
#   - tutti i tempi di arrivo
#   - tutti i tempi di partenza
# Poi ordiniamo tutto in ordine crescente
tempi <- sort(c(0, tempiarrivi, tempipartenze))

# Vettore che indica il numero di utenti nel sistema nel tempo.
# Si costruisce aggiungendo +1 ad ogni arrivo e -1 ad ogni partenza.
# Nell’esempio sotto i valori sono scritti esplicitamente.
n <- c(0,1,2,3,4,3,2,1,0,1,2,1,0,0,1,0,1,2,3,2,1,2,1,0)

# Grafico del numero di utenti nel sistema (curva rossa)
plot(tempi, n, type="s", col="red",
     xlab="Tempo", ylab="Numero utenti nel sistema",
     main="Evoluzione del numero di utenti nel sistema")

############################################################
# Ricostruzione del numero di utenti in coda
############################################################

# Creiamo nuovamente i tempi ordinati
tempi <- sort(c(0, tempiarrivi, tempipartenze))

# Vettore "nq" = numero di utenti in fila di attesa (coda).
# Anche qui +1 se arriva un utente che deve aspettare,
# -1 se un utente inizia servizio o parte. 
# (Nell’esempio i valori sono già dati esplicitamente).
nq <- c(0,0,1,2,3,2,1,0,0,0,0,0,0,1,2,1,0,1,2,1,1,2,1,0)

# Grafico del numero di utenti in coda (curva blu)
plot(tempi, nq, type="s", col="blue",
     xlab="Tempo", ylab="Numero utenti in coda",
     main="Evoluzione del numero di utenti in fila di attesa")