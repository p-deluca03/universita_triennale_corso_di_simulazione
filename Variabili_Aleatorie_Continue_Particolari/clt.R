# Simulazione di variabili Normali standard N(0,1) con CLT
# Metodo: somma di 12 Uniformi(0,1) - 6

# Generiamo 12 sequenze indipendenti Uniformi(0,1) di lunghezza 50000
u1 <- runif(50000)
u2 <- runif(50000)
u3 <- runif(50000)
u4 <- runif(50000)
u5 <- runif(50000)
u6 <- runif(50000)
u7 <- runif(50000)
u8 <- runif(50000)
u9 <- runif(50000)
u10 <- runif(50000)
u11 <- runif(50000)
u12 <- runif(50000)

# Costruiamo la variabile normale standard simulata
z <- u1+u2+u3+u4+u5+u6+u7+u8+u9+u10+u11+u12 - 6

# Calcoliamo media e varianza campionarie
cat("Media campionaria:", mean(z), "\n")
cat("Varianza campionaria:", var(z), "\n")

# Grafico della densità stimata e confronto con N(0,1) teorica
plot(density(z),
     main="Densità normale standard simulata (CLT)",
     xlab="x")
curve(dnorm(x, mean=0, sd=1), add=TRUE, col="red", lwd=2)

legend("topright", legend=c("Simulata", "Teorica N(0,1)"),
       col=c("black", "red"), lwd=2)