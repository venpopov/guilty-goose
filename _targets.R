library(targets)
library(crew)


# Set target options:
tar_option_set(
  error = "null", packages = c("dplyr")
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

# Set other options
options(
  mc.cores = 4,
  brms.backend = "cmdstanr",
  tidyverse.quiet = TRUE,
  dplyr.summarise.inform = FALSE
)

# Targetst pipeline
list(
  tar_target(honig_data_folder, "data-raw/honig2020raw/", format = "file"),
  tar_target(honig_data, preprocess_honig_data(honig_data_folder, "output/honig_data.csv")),
  tar_target(honig_data_uniform, dplyr::filter(honig_data, session %in% c(1, 4))),
  tar_target(exp1_data_file, "data-raw/exp1_2021_data.csv", format = "file"),
  tar_target(exp1_data, preprocess_exp1_data(exp1_data_file, "output/exp1_data.csv")),
  tar_target(
    honig_bmm_fit_by_subject,
    fit_bmm1(honig_data_uniform),
    packages = c("cmdstanr")
  ),
  tar_target(
    honig_bmm_fit_by_subject_and_session,
    fit_bmm2(honig_data),
    packages = c("cmdstanr")
  ),
  tar_target(
    honig_bmm_fit_kappa_by_subject_c_by_session,
    fit_bmm3(honig_data),
    packages = c("cmdstanr")
  )
)
