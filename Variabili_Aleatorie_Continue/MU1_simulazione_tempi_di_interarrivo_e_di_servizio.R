# Simulazione dei tempi di interarrivo e di servizio
# in un sistema M/U/1
#
# Tempi di interarrivo seguono una distribuzione esponenziale Exp(λ).
# Tempi di servizio seguono una distribuzione uniforme U(0, 1/μ).
#
# In questo esempio:
# λ = 1       → E(T) = 1/λ = 1   (tempo medio di interarrivo)
# μ = 4       → E(S) = 1/μ = 1/4 = 0.25 (tempo medio di servizio)
#
# Carico del sistema:
# ρ = λ / μ = 1 / 4 = 0.25 < 1
# quindi il sistema M/U/1 non si congestiona.

# --- Simulazione dei tempi di interarrivo ---
set.seed(3)
tint <- rexp(1000, 1)    # 1000 tempi di interarrivo Exp(λ=1)
mean(tint)               # ≈ 0.984 (vicino al valore teorico 1)

# --- Simulazione dei tempi di servizio ---
set.seed(5)
tserv <- runif(1000, 0, 0.5) 
# 1000 tempi di servizio uniformi in (0, 0.5)
mean(tserv) 
# ≈ 0.2507 (vicino al valore teorico 0.25)


# --- Osservazione ---
# - Media simulata dei tempi di interarrivo ≈ 0.984 → 
# molto vicina al valore teorico 1.
#
# - Media simulata dei tempi di servizio ≈ 0.2507 →
# molto vicina al valore teorico 0.25.
#
# La simulazione conferma che il modello M/U/1
# produce risultati coerenti con i valori attesi teorici.