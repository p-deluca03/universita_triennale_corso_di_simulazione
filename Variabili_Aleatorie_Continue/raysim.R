# Funzione per simulare var. casuali con distribuzione di Rayleigh
raysim <- function(n){
  # Generazione di n numeri uniformi in (0,1)
  u <- runif(n)
  
  # Applicazione del metodo dell'inversione
  # Formula della distribuzione di Rayleigh: y = sqrt(-2 * log(1-u))
  y <- sqrt(-2 * log(1 - u))
  
  return(y)
}