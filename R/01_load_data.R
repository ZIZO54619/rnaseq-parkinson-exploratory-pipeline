# ================================
# 📌 01_load_data
# ================================

if (!exists("raw_expr") || !exists("raw_pheno")) {
  stop("Input paths are not configured. Run source('R/run.R') to initialize configuration.")
}

Data <- read.table(raw_expr, header = TRUE, sep = "\t", row.names = 1)
pheno <- read.table(raw_pheno, header = TRUE, sep = "\t")

pheno$group <- pheno$sample.type

stopifnot(all(colnames(Data) == pheno$sample.id))

cat("no. of genes:", nrow(Data), "\n")
cat("no. of samples:", ncol(Data), "\n")
