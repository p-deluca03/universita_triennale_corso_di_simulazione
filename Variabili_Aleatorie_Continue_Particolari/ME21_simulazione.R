## Creiamo una sequenza di 5000 tempi di interarrivo tint
## distribuiti esponenzialmente con media 1/λ = 1/2.

set.seed(7)                # fissiamo il seme per riproducibilità
z <- runif(5000)           # variabili uniformi (0,1)
tint <- -log(1 - z) / 2    # tempi di interarrivo esponenziali (λ=2)
mean(tint)                 # media campionaria
var(tint)                  # varianza campionaria

## Ora creiamo una sequenza di 5000 tempi di servizio tserv
## distribuiti secondo Erlang di ordine 2, con valore medio 1/μ = 1/4

set.seed(3)
u <- runif(5000)                      # prima sequenza uniforme
set.seed(5)
v <- runif(5000)                      # seconda sequenza uniforme

## Erlang(2, μ=4) = somma di due Exp(μ)
tserv <- -log(1 - u)/8 - log(1 - v)/8
# μ=4 ⇒ parametro=8 per ciascuna Exp
mean(tserv)                           
# media campionaria
var(tserv)                            
# varianza campionaria

## Confronto tra la densità simulata e quella teorica
plot(density(tserv, from=0, to=1),
     main="Densità di Erlang di ordine due simulata",
     xlab="x")
curve(64 * x * exp(-8 * x), add=TRUE, col="red")
# densità teorica Erlang(2, μ=4)