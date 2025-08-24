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