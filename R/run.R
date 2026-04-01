# ================================
# 📌 run
# ================================

get_script_path <- function() {
  cmd_args <- commandArgs(trailingOnly = FALSE)
  file_arg <- grep("^--file=", cmd_args, value = TRUE)
  if (length(file_arg) > 0) {
    return(normalizePath(sub("^--file=", "", file_arg[[1]]), winslash = "/", mustWork = TRUE))
  }

  if (!is.null(sys.frames()[[1]]$ofile)) {
    return(normalizePath(sys.frames()[[1]]$ofile, winslash = "/", mustWork = TRUE))
  }

  stop("Unable to determine script path. Please run with source('R/run.R') or Rscript R/run.R")
}

script_path <- get_script_path()
project_root <- normalizePath(file.path(dirname(script_path), ".."), winslash = "/", mustWork = TRUE)

required_root_paths <- c("R", "configs", "data")
missing_root_paths <- required_root_paths[!dir.exists(file.path(project_root, required_root_paths))]
if (length(missing_root_paths) > 0) {
  stop(sprintf(
    "Detected project root is missing required directories: %s",
    paste(missing_root_paths, collapse = ", ")
  ))
}

paths_config_file <- file.path(project_root, "configs", "paths.yml")
params_config_file <- file.path(project_root, "configs", "params.yml")

if (!file.exists(paths_config_file) || !file.exists(params_config_file)) {
  stop("Missing config files. Expected configs/paths.yml and configs/params.yml under project root.")
}

if (!requireNamespace("yaml", quietly = TRUE)) {
  stop("Package 'yaml' is required to read configs. Install with install.packages('yaml').")
}

cfg_paths <- yaml::read_yaml(paths_config_file)
cfg_params <- yaml::read_yaml(params_config_file)

required_path_keys <- c("raw_expr", "raw_pheno", "out_figures")
missing_path_keys <- required_path_keys[!required_path_keys %in% names(cfg_paths)]
if (length(missing_path_keys) > 0) {
  stop(sprintf("configs/paths.yml is missing required keys: %s", paste(missing_path_keys, collapse = ", ")))
}

if (!"n_top_var_genes" %in% names(cfg_params)) {
  stop("configs/params.yml is missing required key: n_top_var_genes")
}

raw_expr <- file.path(project_root, cfg_paths$raw_expr)
raw_pheno <- file.path(project_root, cfg_paths$raw_pheno)
out_figures <- file.path(project_root, cfg_paths$out_figures)
out_results <- if ("out_results" %in% names(cfg_paths)) file.path(project_root, cfg_paths$out_results) else file.path(project_root, "results")

n_top_var_genes <- as.integer(cfg_params$n_top_var_genes)
if (is.na(n_top_var_genes) || n_top_var_genes <= 0) {
  stop("configs/params.yml key n_top_var_genes must be a positive integer.")
}

dir.create(out_figures, recursive = TRUE, showWarnings = FALSE)
dir.create(out_results, recursive = TRUE, showWarnings = FALSE)

source(file.path(project_root, "R", "00_packages.R"))
source(file.path(project_root, "R", "01_load_data.R"))
source(file.path(project_root, "R", "02_qc_plots.R"))
source(file.path(project_root, "R", "03_pca_analysis.R"))
source(file.path(project_root, "R", "04_heatmaps.R"))

message("Pipeline Finished Successfully!")
