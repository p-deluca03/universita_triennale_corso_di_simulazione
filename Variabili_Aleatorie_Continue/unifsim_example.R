# Esempio: generiamo 30 numeri uniformi in (0,5)
set.seed(3)                         # fisso il seme
round(unifsim(30, 0, 5), 3)         # arrotondo a 3 cifre decimali


# --- Nota sull’uso di round ---
# La funzione round(x, k) arrotonda ogni elemento
# del vettore x a k decimali.


# --- Confronto con la funzione predefinita runif ---
# In R è già disponibile runif(n, min = a, max = b),
# che utilizza lo stesso algoritmo.
# Con lo stesso seme iniziale, i risultati coincidono.

set.seed(3)
round(runif(30, min = 0, max = 5), 3)