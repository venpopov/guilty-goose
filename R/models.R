fit_bmm1 <- function(data) {
  # fit the model
  formula <- bmm::bmf(c ~ 1 + (1 | subject), kappa ~ 1 + (1 | subject))
  model <- bmm::sdm("resperr")
  bmm::bmm(formula, data, model, backend = "cmdstanr", cores = 4)
}

fit_bmm2 <- function(data) {
  # fit the model
  data$session <- as.factor(data$session)
  formula <- bmm::bmf(
    c ~ 0 + session + (0 + session || subject),
    kappa ~ 0 + session + (0 + session || subject)
  )
  model <- bmm::sdm("resperr")
  bmm::bmm(formula, data, model, backend = "cmdstanr", cores = 4)
}


fit_bmm3 <- function(data) {
  # fit the model
  data$session <- as.factor(data$session)
  formula <- bmm::bmf(
    c ~ 0 + session + (0 + session || subject),
    kappa ~ 1 + (1 | subject)
  )
  model <- bmm::sdm("resperr")
  bmm::bmm(formula, data, model, backend = "cmdstanr", cores = 4)
}
