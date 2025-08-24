# Esempio: generiamo 30 valori da Exp(λ = 2) con seme = 3
set.seed(3)
round(expsim(30, 2), 3)


# --- Confronto con la funzione predefinita rexp ---
# In R è disponibile la funzione rexp(n, rate = λ),
# che utilizza lo stesso metodo.
# Con lo stesso seme, i risultati coincidono.

set.seed(3)
round(rexp(30, rate = 2), 3)