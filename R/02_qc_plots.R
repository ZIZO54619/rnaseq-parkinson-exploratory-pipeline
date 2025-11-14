# ================================
# 📌 02_qc_plots
# ================================


pheno$group4 <- paste(pheno$sample.type, pheno$gender, sep="-")

group4_colors_map <- c(
  "Ctrl-Male"="blue",
  "Ctrl-Female"="skyblue",
  "PD-Male"="red",
  "PD-Female"="orange"
)

group4_colors <- group4_colors_map[pheno$group4]

Data_sorted <- Data[, order(colnames(Data))]
group4_colors_sorted <- group4_colors[order(colnames(Data))]

# Boxplot
pdf("boxplot.pdf", width = 10, height = 10)
boxplot(Data_sorted,
        main="Expression across samples",
        las=2,
        col=group4_colors_sorted)

legend(x = 18.1, y = 14.6,
       legend = names(group4_colors_map),
       fill = group4_colors_map,
       cex = 0.5,
       border = NA,
       bty = "n",
       text.font = 1)
dev.off()

# Density
pdf("density.pdf", width = 10, height = 10)

plot(density(Data_sorted[,1]),
     col = group4_colors_sorted[1], lwd = 2,
     xlab = "Expression", ylab = "Density",
     main = "Density Plot - All Samples",
     ylim = c(0, max(sapply(1:ncol(Data_sorted), function(i) max(density(Data_sorted[,i])$y)))),
     panel.first = {
       rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4],
            col = "gray90", border = NA)
       grid(col = "white", lty = "solid")  # الشبكة
     })
for(i in 2:ncol(Data_sorted)) {
  lines(density(Data_sorted[,i]), col = group4_colors_sorted[i], lwd = 2)
}

legend("topright",
       legend = names(group4_colors_map),
       col = group4_colors_map,
       lwd = 2,
       cex = 0.8,
       bty = "n",
       bg = "white")
dev.off()

# histograms
pdf("histograms.pdf", width = 10, height = 10)
for(i in 1:ncol(Data)){
  hist(Data[,i], breaks = 40, main = colnames(Data)[i],
       xlab = "", ylab = "", col = "skyblue", border = "white", cex.main = 0.8)
}
dev.off()
