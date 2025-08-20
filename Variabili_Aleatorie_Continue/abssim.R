set.seed(3)                      
u <- runif(3000) # genero un vettore di 3000 numeri uniformi in (0,1)

set.seed(5)
y <- -log(1-runif(3000)) 
# genero un vettore di 3000 numeri esponenziali(1)
# (con media 1) tramite il metodo dell'inversa

# calcolo la funzione di accettazione:
# exp(-(y-1)^2 / 2) che è proporzionale alla densità del
# valore assoluto di N(0,1)
w <- exp(-(y-1)^2/2)  

# Individuo gli indici per cui u < w
# cioè i punti accettati dal metodo di rifiuto
x <- which(u < w)

# Costruisco il campione simulato con solo i valori accettati di y
z <- y[x]

# Numero di valori accettati
length(x)

# Calcolo media campionaria del campione simulato
mean(z)

# Calcolo varianza campionaria del campione simulato
var(z)