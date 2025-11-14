# ================================
# 📌 03_pca_analysis
# ================================

# PCA 2D
t_data <- t(Data)
pca_result <- prcomp(t_data, scale. = TRUE)
#pdf("PCA_2D.pdf", width = 10, height = 10)
autoplot(pca_result, data = pheno, colour = 'group', label = FALSE, frame = TRUE) +
  ggtitle("PCA - 2D") + 
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "top") +
  scale_color_manual(values = c("PD" = "red", "Ctrl" = "blue"))
#dev.off()


# PCA 3D
pca_df <- as.data.frame(pca_result$x[, 1:3])
pca_df$group <- pheno$group
p <- plot_ly(pca_df, x = ~PC1, y = ~PC2, z = ~PC3,
             color = ~group, colors = c("blue", "red"),
             type = "scatter3d", mode = "markers")
saveWidget(p, file = "PCA_3D.html")


# Variance calculation
gene_vars <- apply(Data, 1, var)
summary(gene_vars)
