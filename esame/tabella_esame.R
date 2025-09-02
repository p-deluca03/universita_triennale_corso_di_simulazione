tabella_esame <- function(n, lambda, mu, seme = NULL) {
  if (!is.null(seme)) set.seed(seme)
  
  # 1) Interarrivi e servizi
  T <- rexp(n, rate = lambda)
  S <- rexp(n, rate = mu)
  
  # 2) Arrivi A(k)
  A <- cumsum(T)
  
  # 3) U (Lindley), W, Q, O
  U <- numeric(n); W <- numeric(n); Q <- numeric(n); O <- numeric(n)
  U[1] <- A[1] + S[1]; W[1] <- S[1]; Q[1] <- 0; O[1] <- A[1]
  for (k in 2:n) {
    U[k] <- max(A[k], U[k-1]) + S[k]
    W[k] <- U[k] - A[k]
    Q[k] <- max(0, W[k] - S[k])
    O[k] <- if (U[k-1] >= A[k]) 0 else A[k] - U[k-1]
  }
  
  # 4) Timeline eventi e stati n(t), q(t), busy(t)
  eventi <- data.frame(
    tempo = c(A, U),
    tipo  = c(rep("A", n), rep("P", n))
  )
  eventi <- eventi[order(eventi$tempo), ]
  eventi <- rbind(data.frame(tempo = 0, tipo = "I"), eventi)
  
  n_state <- numeric(nrow(eventi))
  q_state <- numeric(nrow(eventi))
  busy    <- numeric(nrow(eventi))
  curr_n <- 0
  for (i in 1:nrow(eventi)) {
    if (eventi$tipo[i] == "A") curr_n <- curr_n + 1
    if (eventi$tipo[i] == "P") curr_n <- curr_n - 1
    n_state[i] <- curr_n
    q_state[i] <- ifelse(curr_n > 0, curr_n - 1, 0)
    busy[i]    <- ifelse(curr_n > 0, 1, 0)
  }
  
  # 5) Medie temporali L, Lq, Ls e tassi effettivi
  T_sim <- max(eventi$tempo)
  area_n <- 0; area_q <- 0; area_busy <- 0
  for (i in 2:nrow(eventi)) {
    dt <- eventi$tempo[i] - eventi$tempo[i-1]
    area_n    <- area_n    + n_state[i-1] * dt
    area_q    <- area_q    + q_state[i-1] * dt
    area_busy <- area_busy + busy[i-1]    * dt
  }
  L  <- area_n / T_sim
  Lq <- area_q / T_sim
  Ls <- area_busy / T_sim
  
  # tassi effettivi
  lambda_eff <- n / T_sim
  mu_eff     <- 1 / mean(S)
  rho_eff    <- lambda_eff / mu_eff   # stima dell'intensità di traffico
  
  tab <- data.frame(T = T, S = S, A = A, U = U, W = W, Q = Q, O = O)
  
  list(
    data = tab,
    stats = list(
      T_sim = T_sim,
      lambda = lambda, mu = mu,
      lambda_eff = lambda_eff,
      mu_eff = mu_eff,
      rho_eff = rho_eff,
      L = L, Lq = Lq, Ls = Ls,
      mean_W = mean(W),
      mean_Q = mean(Q),
      mean_S = mean(S)
    ),
    eventi = list(
      timeline = eventi,
      n_state = n_state,
      q_state = q_state
    )
  )
}