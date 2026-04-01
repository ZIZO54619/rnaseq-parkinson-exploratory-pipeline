# ================================
# 📌 00_packages
# ================================

required_cran <- c(
  "tidyverse",
  "plotly",
  "ggfortify",
  "ggplot2",
  "htmlwidgets",
  "readr",
  "yaml"
)

required_bioc <- c(
  "ComplexHeatmap",
  "circlize"
)

missing_cran <- required_cran[!vapply(required_cran, requireNamespace, logical(1), quietly = TRUE)]
missing_bioc <- required_bioc[!vapply(required_bioc, requireNamespace, logical(1), quietly = TRUE)]

if (length(missing_cran) > 0 || length(missing_bioc) > 0) {
  msg <- c("Missing required R packages detected.")

  if (length(missing_cran) > 0) {
    msg <- c(
      msg,
      sprintf("- Missing CRAN packages: %s", paste(missing_cran, collapse = ", ")),
      sprintf("  Install with: install.packages(c(%s))", paste(sprintf('"%s"', missing_cran), collapse = ", "))
    )
  }

  if (length(missing_bioc) > 0) {
    msg <- c(
      msg,
      sprintf("- Missing Bioconductor packages: %s", paste(missing_bioc, collapse = ", ")),
      "  Install with:",
      "    if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager')",
      sprintf("    BiocManager::install(c(%s))", paste(sprintf('"%s"', missing_bioc), collapse = ", "))
    )
  }

  stop(paste(msg, collapse = "\n"), call. = FALSE)
}

library(ComplexHeatmap)
library(circlize)
library(tidyverse)
library(plotly)
library(ggfortify)
library(ggplot2)
library(htmlwidgets)
library(readr)
library(yaml)
