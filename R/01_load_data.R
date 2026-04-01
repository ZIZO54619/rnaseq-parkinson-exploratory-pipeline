# ================================
# 📌 01_load_data
# ================================

if (!exists("raw_expr") || !exists("raw_pheno")) {
  stop("Input paths are not configured. Run source('R/run.R') to initialize configuration.")
}

if (!file.exists(raw_expr)) {
  stop(sprintf("Expression file not found: %s", raw_expr))
}

if (!file.exists(raw_pheno)) {
  stop(sprintf("Phenotype file not found: %s", raw_pheno))
}

Data <- read.table(raw_expr, header = TRUE, sep = "\t", row.names = 1, check.names = FALSE)
pheno <- read.table(raw_pheno, header = TRUE, sep = "\t", check.names = FALSE)

required_pheno_cols <- c("sample.id", "sample.type", "gender", "age")
missing_pheno_cols <- setdiff(required_pheno_cols, colnames(pheno))
if (length(missing_pheno_cols) > 0) {
  stop(sprintf(
    "Phenotype file is missing required columns: %s",
    paste(missing_pheno_cols, collapse = ", ")
  ))
}

if (ncol(Data) == 0 || nrow(Data) == 0) {
  stop("Expression matrix is empty after loading.")
}

if (anyNA(colnames(Data))) {
  stop("Expression matrix has NA sample names in column headers.")
}

if (anyDuplicated(colnames(Data))) {
  dup_data <- unique(colnames(Data)[duplicated(colnames(Data))])
  stop(sprintf("Expression matrix has duplicated sample columns: %s", paste(dup_data, collapse = ", ")))
}

if (anyNA(pheno$sample.id)) {
  stop("Phenotype table has NA values in sample.id.")
}

if (anyDuplicated(pheno$sample.id)) {
  dup_pheno <- unique(pheno$sample.id[duplicated(pheno$sample.id)])
  stop(sprintf("Phenotype table has duplicated sample.id values: %s", paste(dup_pheno, collapse = ", ")))
}

samples_in_data_not_pheno <- setdiff(colnames(Data), pheno$sample.id)
samples_in_pheno_not_data <- setdiff(pheno$sample.id, colnames(Data))
if (length(samples_in_data_not_pheno) > 0 || length(samples_in_pheno_not_data) > 0) {
  stop(sprintf(
    paste(
      "Sample ID mismatch between expression and phenotype.",
      "In expression not phenotype: %s.",
      "In phenotype not expression: %s.",
      sep = "\n"
    ),
    if (length(samples_in_data_not_pheno) > 0) paste(samples_in_data_not_pheno, collapse = ", ") else "none",
    if (length(samples_in_pheno_not_data) > 0) paste(samples_in_pheno_not_data, collapse = ", ") else "none"
  ))
}

if (!all(colnames(Data) == pheno$sample.id)) {
  stop(
    paste(
      "Sample IDs are the same set but order differs.",
      "Reorder phenotype to match expression columns (e.g., pheno <- pheno[match(colnames(Data), pheno$sample.id), ]).",
      sep = "\n"
    )
  )
}

pheno$group <- pheno$sample.type

cat("no. of genes:", nrow(Data), "\n")
cat("no. of samples:", ncol(Data), "\n")
