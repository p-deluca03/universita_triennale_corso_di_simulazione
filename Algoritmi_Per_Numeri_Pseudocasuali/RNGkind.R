# Mostra i generatori di numeri casuali attualmente in uso
RNGkind()
# [1] "Mersenne-Twister" "Inversion" "Rejection"

# Significato:
# "Mersenne-Twister" → generatore principale di numeri uniformi in (0,1),
#                      molto usato per la sua ottima qualità statistica e periodo enorme.
#
# "Inversion"        → metodo per generare numeri casuali dalla distribuzione normale N(0,1),
#                      usando l'inversa della funzione di ripartizione.
#
# "Rejection"        → metodo di campionamento per generare variabili discrete
#                      (come Binomiale e Poisson) tramite rejection sampling.