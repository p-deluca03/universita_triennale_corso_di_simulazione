############################################################
# Parametri del sistema
############################################################
n <- 500; lambda <- 1.2; mu <- 2; seme <- 42
rho <- lambda / mu
cat("\nIntensità di traffico teorica ρ = ", rho, "\n")

############################################################
# Esecuzione simulazione
############################################################
out <- tabella_esame(n, lambda, mu, seme)

# --- Tabella e statistiche sulla tabella ---
df <- out$data
View(df)

medie    <- apply(df, 2, mean)
varianze <- apply(df, 2, var)
devst    <- apply(df, 2, sd)
cv       <- devst / medie
cv_perc  <- 100 * cv

cat("\n=== Medie campionarie ===\n"); print(medie)
cat("\n=== Varianze campionarie ===\n"); print(varianze)
cat("\n=== Deviazioni standard ===\n"); print(devst)
cat("\n=== Coeff. di variazione (%) ===\n"); print(cv_perc)

# --- Numeri medi e tassi effettivi ---
s <- out$stats
cat("\n=== Stime temporali e tassi effettivi ===\n")
cat("T_sim: ", s$T_sim, "\n")
cat("L  (sistema):  ", s$L,  "\n")
cat("Lq (coda):     ", s$Lq, "\n")
cat("Ls (servizio): ", s$Ls, "\n")
cat("lambda_eff:    ", s$lambda_eff, "\n")
cat("mu_eff:        ", s$mu_eff, "\n")
cat("rho_eff:       ", s$rho_eff, "  (confronta con Ls ≈ utilizzo)\n")

############################################################
# Grafici con colori
############################################################
eventi   <- out$eventi$timeline
n_state  <- out$eventi$n_state
q_state  <- out$eventi$q_state

plot(eventi$tempo, n_state, type="s",
     xlab="Tempo", ylab="Numero utenti nel sistema",
     main="Evoluzione del numero di utenti nel sistema",
     col="red", lwd=2); grid(col="gray", lty="dotted")

plot(eventi$tempo, q_state, type="s",
     xlab="Tempo", ylab="Numero utenti in coda",
     main="Evoluzione del numero di utenti in fila di attesa",
     col="blue", lwd=2); grid(col="gray", lty="dotted")