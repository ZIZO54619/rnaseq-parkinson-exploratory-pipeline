# ================================
# 📌 01_load_data
# ================================

sessionInfo()
# R version 4.4.3 (2025-02-28 ucrt)
# Platform: x86_64-w64-mingw32/x64
# Running under: Windows 10 x64 (build 19045)
# locale: LC_COLLATE=English_United States.utf8 

Data <- read.table("data/raw/Parkinson_exp.txt", header=TRUE, sep="\t", row.names=1)
pheno <- read.table("data/raw/Parkinson_phenotable.txt", header=TRUE, sep="\t")

pheno$group <- pheno$sample.type

stopifnot(all(colnames(Data) == pheno$sample.id))

cat("no. of genes:", nrow(Data), "\n")
cat("no. of samples:", ncol(Data), "\n")
