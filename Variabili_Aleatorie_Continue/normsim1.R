# 1) Campioni per il metodo di rifiuto: u ~ U(0,1), y ~ Exp(1)
set.seed(3)
u <- runif(3000) # numeri uniformi per la regola di accettazione

set.seed(5)
y <- -log(1 - runif(3000)) # numeri ~ Exp(1) (inversa della CDF)

# 2) Probabilità di accettazione per |Z|
w <- exp(-(y - 1)^2 / 2)          # funzione di accettazione

# 3) Indici accettati e campione di |Z|
idx <- which(u < w)      # indici accettati
z_abs <- y[idx]          # questo è un campione di X = |Z|

length(idx)              # numero di osservazioni accettate (≈ 2270)

# 4) Assegna segno casuale ±1 con probabilità 1/2
set.seed(7)
v <- runif(length(idx))           # unif(0,1) per il segno
v[ v < 0.5 ]  <- -1               # metà dei casi negativi
v[ v >= 0.5 ] <-  1               # metà positivi

#  5) Combina modulo e segno: Z = v * |Z|
Z <- z_abs * v

length(Z)      # numero finale di campioni
mean(Z)        # media campionaria (≈ 0)
var(Z)         # varianza campionaria (≈ 1)

# 6) Confronto grafico: densità simulata vs densità teorica N(0,1)
plot(
  density(Z),
  main = "Densità: normale standard simulata",
  xlab = "z", ylab = "densità"
)
curve(dnorm(x, mean = 0, sd = 1), add = TRUE, col = "red")
legend("topright", legend = c("Simulata", "Teorica N(0,1)"),
       lty = c(1,1), col = c("black","red"), bty = "n")