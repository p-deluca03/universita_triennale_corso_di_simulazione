# Fissiamo i semi per riproducibilità
set.seed(3)      
u <- runif(3000)   # Generiamo 3000 numeri uniformi in (0,1)
set.seed(5)      
y <- -log(1-runif(3000))   # Generiamo 3000 numeri esponenziali(1)

# Applichiamo la funzione di accettazione/reiezione
v <- exp(-(y-1)^2/2)   # Valori della funzione target
z <- which(u < v)      # Selezioniamo gli indici accettati
x <- y[z]              # Costruiamo il campione accettato

length(x)  # Numero di campioni accettati (~2270)
# Seconda fase: generazione della normale standard
set.seed(7)
v <- runif(length(x)) 
# Generiamo un nuovo vettore uniforme lungo quanto x

# Assegniamo segno negativo a metà dei valori per simulare N(0,1)
v[v < 0.5] <- -1
v[v >= 0.5] <- 1
z <- x * v

length(z)  # Numero di campioni simulati (2270)
# Trasformiamo la normale standard in N(μ=2, σ=0.1)
t <- 2 + 0.1 * z   

length(t)    # Numero di valori finali = 2270
mean(t)      # Media campionaria
var(t)       # Varianza campionaria
# Grafico della densità simulata vs teorica
plot(density(t), main="Densità normale simulata", xlab="x")
curve(dnorm(x, mean=2, sd=0.1), add=TRUE, col="red")
