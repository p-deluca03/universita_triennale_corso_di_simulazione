# Simulazione dei tempi di interarrivo e di servizio
# in un sistema M/M/1
#
# Tempi di interarrivo seguono una distribuzione esponenziale Exp(λ).
# Tempi di servizio seguono una distribuzione esponenziale Exp(μ).
#
# In questo esempio:
# λ = 1  → E(T) = 1/λ = 1   (tempo medio di interarrivo)
# μ = 2  → E(S) = 1/μ = 0.5 (tempo medio di servizio)
#
# Il carico del sistema è:
# ρ = λ / μ = 1 / 2 = 0.5 < 1
# quindi il sistema M/M/1 non si congestiona.

# --- Simulazione dei tempi di interarrivo ---
set.seed(3)
tint <- rexp(1000, 1)   # 1000 tempi di interarrivo con Exp(λ=1)
mean(tint)              # media campionaria ≈ 0.984 (vicina a 1)

# --- Simulazione dei tempi di servizio ---
set.seed(5)
tserv <- rexp(1000, 2)  # 1000 tempi di servizio con Exp(μ=2)
mean(tserv)             # media campionaria ≈ 0.501 (vicina a 0.5)


# --- Osservazione ---
# - La media campionaria dei tempi di interarrivo è ≈ 0.984,
# vicina al valore teorico 1.
# - La media campionaria dei tempi di servizio è ≈ 0.501,
# vicina al valore teorico 0.5.
#
# Questo conferma che la simulazione produce risultati
# coerenti con il modello teorico M/M/1.