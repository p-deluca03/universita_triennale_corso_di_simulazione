tabella_esempio <- tabella_esempio()
print(tabella_esempio)

apply(tabella_esempio, 2, mean)  # medie
apply(tabella_esempio, 2, var)   # varianze
apply(tabella_esempio, 2, sd)    # deviazioni standard

############################################################
# Grafico del numero di utenti nel sistema
############################################################
tempiarrivi   <- tabella_esempio$A
tempipartenze <- tabella_esempio$U

# Lista eventi: arrivi (A) e partenze (P)
eventi <- data.frame(
  tempo = c(tempiarrivi, tempipartenze),
  tipo  = c(rep("A", length(tempiarrivi)), rep("P", length(tempipartenze)))
)
eventi <- eventi[order(eventi$tempo), ]
eventi <- rbind(data.frame(tempo=0, tipo="I"), eventi)  # aggiungo tempo 0

# Calcolo n(t) = utenti nel sistema
n <- numeric(nrow(eventi))
count <- 0
for (i in 1:nrow(eventi)) {
  if (eventi$tipo[i]=="A") count <- count+1
  if (eventi$tipo[i]=="P") count <- count-1
  n[i] <- count
}

# Plot n(t)
plot(eventi$tempo, n, type="s", col="red",
     xlab="Tempo", ylab="Numero utenti nel sistema",
     main="Evoluzione del numero di utenti nel sistema")

############################################################
# Grafico del numero di utenti in coda
############################################################
# Calcolo q(t) = utenti in attesa = n(t) - server_occupato
# Server è occupato se n(t) > 0
q <- ifelse(n > 0, n - 1, 0)

plot(eventi$tempo, q, type="s", col="blue",
     xlab="Tempo", ylab="Numero utenti in coda",
     main="Evoluzione del numero di utenti in fila di attesa")
