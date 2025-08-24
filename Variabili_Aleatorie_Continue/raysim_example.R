set.seed(3)  
# Generiamo 30 numeri Rayleigh
round(raysim(30), 3)
# Risultato (stesso dell'immagine)
# [1] 0.607 1.815 0.986 0.891 1.358 1.362 0.516 0.835 1.313 1.412 ...
# ecc.

# ---------------------------
# Calcolo di media e varianza
# ---------------------------

set.seed(3)
x <- raysim(5000)   # sequenza di 5000 valori
mean(x)             # ≈ 1.258 (vicino al valore teorico sqrt(pi/2))
var(x)              # ≈ 0.429 (vicino al valore teorico 2 - pi/2)