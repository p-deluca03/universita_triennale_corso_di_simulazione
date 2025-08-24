
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