# Simulazione del lancio di due dadi
# e calcolo della somma dei risultati

set.seed(1)                                   
# fisso il seme per il primo dado
x1 <- sample(1:6, 50000, replace = TRUE)      
# simulo 50.000 lanci del primo dado

set.seed(2)                                   
# fisso il seme per il secondo dado
x2 <- sample(1:6, 50000, replace = TRUE)      
# simulo 50.000 lanci del secondo dado

s <- x1 + x2                                  
# calcolo la somma dei due dadi

# Frequenze assolute: quante volte appare ciascun valore (da 2 a 12)
table(s)

# Frequenze relative: proporzioni rispetto al numero totale di lanci
table(s) / length(s)

# Media della distribuzione delle somme
mean(s)

# Varianza della distribuzione delle somme
var(s)


# --- Spiegazione ---
# Abbiamo effettuato 50.000 lanci di due dadi. 
# I risultati sono memorizzati nei vettori x1 e x2.
# Il vettore s contiene le somme dei valori ottenuti dai due dadi.
#
# - table(s) calcola le frequenze assolute (conteggio di ogni somma).
# - table(s) / length(s) calcola le frequenze relative (percentuali).
# - mean(s) restituisce il valore medio
# della distribuzione delle somme.
# - var(s) restituisce la varianza della distribuzione.