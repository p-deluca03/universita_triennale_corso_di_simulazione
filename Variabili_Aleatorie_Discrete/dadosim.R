# Funzione dadosim: simulazione del lancio di un dado a 6 facce
# Parametri:
# - n : numero di lanci da simulare
#
# Funzionamento:
# 1. Si generano n numeri uniformi u ~ U(0,1).
# 2. L’intervallo (0,1) viene suddiviso in 6 sottointervalli
# di ampiezza 1/6.
# 3. Ogni sottointervallo corrisponde a una faccia del dado (1,...,6)
# 4. In base al valore di u, assegniamo al risultato la
# faccia corrispondente.
#
# Restituisce un vettore di n valori, ciascuno tra 1 e 6.

dadosim <- function(n) {
  u <- runif(n)                  # genera n numeri uniformi
  u[which(u < 1/6)] <- 1
  u[which(u >= 1/6 & u < 2/6)] <- 2
  u[which(u >= 2/6 & u < 3/6)] <- 3
  u[which(u >= 3/6 & u < 4/6)] <- 4
  u[which(u >= 4/6 & u < 5/6)] <- 5
  u[which(u >= 5/6 & u < 1)]   <- 6
  return(u)
}

# Esempio di utilizzo:
set.seed(1)   # fisso il seme per rendere i risultati riproducibili
dadosim(30)   # simula 30 lanci di dado


# --- Alternativa con sample() ---
# È possibile simulare i lanci di un dado con
# la funzione predefinita sample():
#   sample(1:6, size, replace = TRUE)
# dove:
# - 1:6 rappresenta le facce del dado
# - size è il numero di lanci
# - replace = TRUE permette il reinserimento
# (necessario per più lanci)

sample(1:6, 30, replace = TRUE) 
# simula 30 lanci di dado non truccato