# ===============================
# 📌 04_heatmaps
# ===============================


top100_var_genes <- names(sort(gene_vars, decreasing = TRUE))[1:100]
top100_data <- Data[top100_var_genes, ]
#pdf("Heatmap_top100.pdf", width = 10, height = 10)
Heatmap(top100_data, name = "Expression", show_row_names = FALSE)
#dev.off()


z_score_data <- t(scale(t(top100_data)))
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

#pdf("Z-score_heatmap.pdf", width = 10, height = 10)
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
#dev.off()


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

pdf("Z-score_heatmap3D.pdf", width = 10, height = 10)
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
