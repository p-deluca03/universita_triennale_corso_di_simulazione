############################################################
# Parametri del sistema
############################################################
n      <- 20       # numero clienti simulati
lambda <- 1.2      # tasso di arrivo
mu     <- 2        # tasso di servizio
seme   <- 42       # seme randomico
rho    <- lambda/mu  # intensità di traffico

cat("\nIntensità di traffico ρ = ", rho, "\n")

############################################################
# Costruzione tabella e statistiche descrittive
############################################################
tabella_esame <- tabella_esame(n, lambda, mu, seme)

# Visualizza tabella in scheda
View(tabella_esame)

# Medie, varianze, deviazioni standard, coefficienti di variazione
medie <- apply(tabella_esame, 2, mean)
varianze <- apply(tabella_esame, 2, var)
devst <- apply(tabella_esame, 2, sd)
cv <- devst / medie
cv_perc <- cv * 100

cat("\n=== Medie campionarie ===\n"); print(medie)
cat("\n=== Varianze campionarie ===\n"); print(varianze)
cat("\n=== Deviazioni standard campionarie ===\n"); print(devst)
cat("\n=== Coefficienti di variazione (CV = sd/mean) ===\n"); print(cv)
cat("\n=== Coefficienti di variazione in percentuale (CV%) ===\n"); print(cv_perc)

############################################################
# Grafico del numero di utenti nel sistema
############################################################
tempiarrivi   <- tabella_esame$A
tempipartenze <- tabella_esame$U

# Costruzione lista eventi
eventi <- data.frame(
  tempo = c(tempiarrivi, tempipartenze),
  tipo  = c(rep("A", length(tempiarrivi)), rep("P", length(tempipartenze)))
)
eventi <- eventi[order(eventi$tempo), ]
eventi <- rbind(data.frame(tempo=0, tipo="I"), eventi)

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
q <- ifelse(n > 0, n - 1, 0)

plot(eventi$tempo, q, type="s", col="blue",
     xlab="Tempo", ylab="Numero utenti in coda",
     main="Evoluzione del numero di utenti in fila di attesa")