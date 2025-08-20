# Funzione per generare N punti distribuiti uniformemente
# all'interno di un cerchio di raggio R centrato nell'origine
gencerchio <- function(N, R){
  
  set.seed(5) 
  # fisso il seme per la generazione casuale dell'angolo
  u <- runif(N)
  # genero N numeri uniformi in (0,1) che serviranno per θ
  
  set.seed(7)
  # fisso un altro seme per la generazione casuale del raggio
  v <- runif(N)
  # genero N numeri uniformi in (0,1) che serviranno per r
  
  # Inizializzo i vettori
  r <- numeric(N)       # raggio di ciascun punto
  teta <- numeric(N)    # angolo θ
  ascissa <- numeric(N) # coordinate x
  ordinata <- numeric(N)# coordinate y
  
  # Creo un data frame vuoto che conterrà le coordinate dei punti
  df <- data.frame(X = 1:N, Y = 1:N)
  row.names(df) <- 1:N
  
  # Ciclo per generare i punti
  for(i in 1:N){
    r[i] <- R * sqrt(v[i])
    # calcolo il raggio trasformando v (per avere densità uniforme)
    teta[i] <- 2 * pi * u[i]
    # calcolo l’angolo in [0, 2π]
    
    ascissa[i] <- r[i] * cos(teta[i])
    # trasformazione in coordinate cartesiane (x)
    ordinata[i] <- r[i] * sin(teta[i])
    # trasformazione in coordinate cartesiane (y)
    
    df[i,1] <- ascissa[i]   # salvo la coordinata x nel data frame
    df[i,2] <- ordinata[i]  # salvo la coordinata y nel data frame
  }
  
  return(df)   # restituisco il data frame con tutte le coppie (x,y)
}

# Esempio: generiamo 10 punti in un cerchio di raggio 2
gencerchio(10, 2)

# Esempio: visualizziamo 1000 punti in un cerchio di raggio 2
plot(
  gencerchio(1000, 2),
  col="blue",
  main="Punti uniformi in un cerchio di raggio 2"
)