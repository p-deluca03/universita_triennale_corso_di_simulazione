## Simulazione di tempi di interarrivo
## e tempi di servizio iperesponenziali
## ------------------------------------------------------------------

## Generiamo 10000 tempi di interarrivo uniformi in (0,1)
set.seed(3)
u <- runif(10000)
tint <- u
mean(tint)   # media campionaria dei tempi di interarrivo
var(tint)    # varianza campionaria

## Generiamo 10000 tempi di servizio iperesponenziali
set.seed(5)
v <- runif(10000)
# variabili per selezionare la componente della miscela
set.seed(7)
h <- runif(10000)
# variabili per la parte Exp(2)
set.seed(9)
k <- runif(10000)
# variabili per la parte Exp(6)

## Indici delle osservazioni che appartengono alle due componenti
y1 <- which(v < 1/4)     # probabilità 1/4 → Exp(2)
y2 <- which(v >= 1/4)    # probabilità 3/4 → Exp(6)

## Vettore dei tempi di servizio
tserv <- numeric(10000)
tserv[y1] <- -log(1 - h[y1]) / 2   # Exp(2)
tserv[y2] <- -log(1 - k[y2]) / 6   # Exp(6)

length(tserv)  # numero di osservazioni generate
mean(tserv)    # media campionaria ≈ 0.25 (media teorica)
var(tserv)     # varianza campionaria ≈ 0.104 (varianza teorica)

## Confronto grafico:
# istogramma (densità campionaria) + curva teorica
hist(tserv, freq=FALSE, breaks=100, xlim=c(0,3),
     main="Istogramma della densità iperesponenziale simulata",
     xlab="x")
curve(exp(-2*x)/2 + 9*exp(-6*x)/2, add=TRUE, col="red", xlim=c(0,3))