# Versione alternativa con rgeom:
# La distribuzione geometrica può essere generata
# direttamente con rgeom.
# Per M/M/1 in equilibrio, il numero di utenti è
# distribuito geometricamente con parametro (1 - ρ).

MM1queueBis <- function(n, rho, seme) {
  set.seed(seme)           # imposto il seme
  N <- rgeom(n, 1 - rho)   # generazione con distribuzione geometrica
  return(N)
}

# Esempio:
utentiBis <- MM1queueBis(1000, 0.6, 7)
mean(utentiBis) # media campionaria (~1.523)
table(utentiBis)
round(table(utentiBis)/length(utentiBis), 3)