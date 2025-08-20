# La funzione set.seed(seme) permette di stabilire un intero
# che definisce il seme del generatore.
# La funzione runif(n, min = a, max = b) genera una sequenza di
# n numeri uniformi nell’intervallo (a, b).
#
# - Se a = 0 e b = 1, si ottiene una sequenza di numeri
# uniformemente distribuiti in (0,1).
# - Se i parametri min e max non sono specificati,
# i valori di default sono a = 0 e b = 1.
#
# - Se non si usa set.seed(seme), il seme iniziale viene scelto
# casualmente e modificato dopo ogni generazione.
# In questo modo, si ottengono sequenze diverse a ogni esecuzione.
#
# - Se invece si usa set.seed(seme), la sequenza generata sarà
# sempre la stessa, permettendo di riprodurre i risultati.

set.seed(seme) # imposta il seme del generatore
runif(n, min = a, max = b) # genera n numeri casuali uniformi
# nell'intervallo (a, b)