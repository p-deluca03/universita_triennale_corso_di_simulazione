# Funzione MM2queueBis: simulazione alternativa per il sistema M/M/2
# usando la funzione predefinita rgeom di R.
#
# Parametri:
# - n     : numero di osservazioni da generare
# - rho2  : intensità di traffico (ρ2 = λ / (2μ))
# - seme  : seme per la riproducibilità
#
# Distribuzione:
# Il numero di utenti nel sistema M/M/2 in equilibrio
# segue una distribuzione geometrica con parametro:
#   p = (1 - ρ2) / (1 + ρ2)
#
# Valore atteso teorico:
#   E(N) = (2 * ρ2) / (1 - ρ2^2)

MM2queueBis <- function(n, rho2, seme) {
  set.seed(seme)                                    
  # imposta il seme
  p <- (1 - rho2) / (1 + rho2)                      
  # parametro della geom
  N <- rgeom(n, p)                                  
  # genera osservazioni
  return(N)
}