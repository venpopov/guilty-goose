library(targets)

# Set target options:
tar_option_set(error = "null")

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

# Set other options
suppressPackageStartupMessages(library(brms))
suppressPackageStartupMessages(library(bmm))
options(
  mc.cores = 4,
  brms.backend = "cmdstanr",
  tidyverse.quiet = TRUE,
  dplyr.summarise.inform = FALSE
)

# Targetst pipeline
list(
  tar_target(
    honig_data_folder,
    "data-raw/honig2020raw/",
    format = "file"
  ),
  tar_target(
    honig_preprocessed_file,
    preprocess_honig_data(honig_data_folder, "output/honig_data.csv"),
    format = "file"
  ),
  tar_target(
    honig_data,
    read.csv(honig_preprocessed_file)
  )
)
