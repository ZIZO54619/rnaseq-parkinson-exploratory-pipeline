# ===============================
# 📌 04_heatmaps
# ===============================

if (!exists("out_figures") || !exists("n_top_var_genes")) {
  stop("Output directory/parameters are not configured. Run source('R/run.R') to initialize configuration.")
}

if (n_top_var_genes > nrow(Data)) {
  stop(sprintf("n_top_var_genes (%d) exceeds available genes (%d).", n_top_var_genes, nrow(Data)))
}

top_var_genes <- names(sort(gene_vars, decreasing = TRUE))[1:n_top_var_genes]
top_var_data <- Data[top_var_genes, ]

heatmap_top_file <- file.path(out_figures, sprintf("Heatmap_top%d.pdf", n_top_var_genes))
zscore_heatmap_file <- file.path(out_figures, "Z-score_heatmap.pdf")
zscore_heatmap3d_file <- file.path(out_figures, "Z-score_heatmap3D.pdf")

pdf(heatmap_top_file, width = 10, height = 10)
print(Heatmap(top_var_data, name = "Expression", show_row_names = FALSE))
dev.off()

z_score_data <- t(scale(t(top_var_data)))
pheno_ordered <- pheno[match(colnames(z_score_data), pheno$sample.id), ]
stopifnot(all(pheno_ordered$sample.id == colnames(z_score_data)))

annotation_colors <- list(
  sample.type = c("PD" = "red", "Ctrl" = "blue"),
  gender = c("Male" = "skyblue", "Female" = "pink"),
  age = colorRamp2(c(min(pheno_ordered$age), max(pheno_ordered$age)), c("white", "black"))
)

col_anno <- HeatmapAnnotation(
  df = pheno_ordered[, c("sample.type", "gender", "age")],
  col = annotation_colors,
  annotation_name_side = "left",
  annotation_name_gp = gpar(fontsize = 12),
  gp = gpar(fontsize = 10)
)

my_order <- pheno_ordered$sample.id[order(pheno_ordered$sample.type)]

pdf(zscore_heatmap_file, width = 10, height = 10)
print(
  Heatmap(
    z_score_data,
    name = "Z-score",
    col = colorRamp2(c(-2, 0, 2), c("pink", "white", "green")),
    show_row_names = TRUE,
    top_annotation = col_anno,
    cluster_columns = FALSE,
    cluster_rows = TRUE,
    column_order = my_order,
    column_names_gp = gpar(fontsize = 12),
    row_names_gp = gpar(fontsize = 5),
    heatmap_legend_param = list(
      title_gp = gpar(fontsize = 14),
      labels_gp = gpar(fontsize = 9)
    )
  )
)
dev.off()

z_score_data_pos <- z_score_data - min(z_score_data) + 1
z_score_data_pos <- z_score_data_pos[, my_order]

annotation_colors <- list(
  sample.type = c("PD" = "red", "Ctrl" = "blue"),
  gender = c("Male" = "skyblue", "Female" = "pink"),
  age = colorRamp2(c(min(pheno_ordered$age), max(pheno_ordered$age)), c("white", "black"))
)

col_anno <- HeatmapAnnotation(
  df = pheno_ordered[, c("sample.type", "gender", "age")],
  col = annotation_colors,
  annotation_name_side = "left",
  annotation_name_gp = gpar(fontsize = 12),
  gp = gpar(fontsize = 10)
)

pdf(zscore_heatmap3d_file, width = 10, height = 10)
Heatmap3D(
  z_score_data_pos,
  name = "Z-score",
  col = colorRamp2(c(min(z_score_data_pos), max(z_score_data_pos)), c("white", "red")),
  top_annotation = col_anno,
  show_row_names = TRUE,
  cluster_columns = FALSE,
  column_order = my_order,
  cluster_rows = TRUE,
  column_names_gp = gpar(fontsize = 14, fontface = "bold"),
  row_names_gp = gpar(fontsize = 7),
  row_names_side = "right",
  bar_angle = 50,
  bar_rel_width = 0.9,
  bar_rel_height = 0.8
)
dev.off()
