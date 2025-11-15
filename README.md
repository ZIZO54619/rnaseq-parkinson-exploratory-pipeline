# 🧬 RNA-Seq Exploratory Analysis — Parkinson’s Dataset

This repository contains a complete exploratory RNA-seq workflow applied to a Parkinson vs Control dataset.  
The pipeline includes data loading, quality control, PCA, and heatmap-based visualization of the most variable genes.

---

## 📌 Graphical Abstract  

<p align="center">
  <img alt="Graphical abstract" src="https://github.com/user-attachments/assets/e4c9ba06-c24a-435c-981e-7e8e2ed5fc4a" width="900" />
</p>

---

## 📁 Project Overview

This project performs an exploratory analysis of RNA-Seq data from Parkinson’s disease (PD) vs Control samples, focusing on:

- Preprocessing & Quality Control  
- Dimensionality Reduction (PCA 2D & 3D)  
- Feature Selection (Top variable genes)  
- Heatmap and Z-score visualization  
- Identification of potential disease-associated biological patterns  

The goal is to build a clean, reproducible exploratory pipeline that can be reused as a template for other RNA-Seq datasets.

---

## 🧾 Dataset

The analysis is based on:

- **Expression matrix**: gene-level expression for Parkinson and Control samples  
- **Phenotype table**: sample annotations including:
  - Disease status (PD vs Control)  
  - Age  
  - Gender  
  - Sample type / group labels  

Files are stored under:

- `data/raw/`  
  - `Parkinson_exp.txt`  
  - `Parkinson_phenotable.txt`  

---

## 🔍 Quality Control (QC)

Before applying PCA or selecting variable genes, quality control was performed to evaluate sample distribution, detect outliers, and ensure data consistency.

### 1️⃣ Boxplot — Expression distribution per sample

The boxplot visualizes global gene expression distribution across all samples to check:

- Library size differences  
- Abnormal shifts  
- Potential batch effects  

<p align="center">
  <img alt="Boxplot" src="https://github.com/user-attachments/assets/b3a29e46-f441-4c03-a262-eda349901d75" width="750" />
</p>

---

### 2️⃣ Density Plot — Checking distribution alignment

Density curves help evaluate whether samples follow a similar global distribution.  
Misaligned density shapes may indicate:

- Technical artifacts  
- Poor-quality samples  
- Scaling or normalization issues  

<p align="center">
  <img alt="Density plot" src="https://github.com/user-attachments/assets/4a2e77c9-3539-4254-a363-73b6fd7373f0" width="750" />
</p>

---

### 3️⃣ Histograms — Per-sample gene expression

Histograms allow inspecting the full distribution shape for individual samples and across all samples.

<p align="center">
  <img alt="Histogram — single sample" src="https://github.com/user-attachments/assets/8b21f342-5da3-4341-bc41-703e08a22e5c" width="450" />
</p>

<p align="center">
  <img alt="Histograms — all samples" src="https://github.com/user-attachments/assets/95a19399-1eb0-4225-8596-b1e8707d1425" width="900" />
</p>

---

## 🔷 Principal Component Analysis (PCA)

PCA was applied to explore natural sample structure, detect separation between Parkinson vs Control subjects, and identify potential outliers.

### 1️⃣ PCA 2D — Global sample separation

The 2D PCA scatter plot shows:

- Clear separation between **PD** and **Control** samples  
- PC1 and PC2 together explain a large portion of the variance  
- No strong visible batch effects  
- One sample (previously noted in QC) lies closer to the PD cluster  
  → Potential misclassification or hidden phenotype effect

<p align="center">
  <img alt="PCA 2D" src="https://github.com/user-attachments/assets/bf8ee7a4-df15-4b3b-9dbc-ccd99823efe5" width="650" />
</p>

---

### 2️⃣ PCA 3D — Interactive sample visualization

A 3D PCA plot provides a deeper look at sample grouping and local structure.

👉 **[Open PCA_3D interactive plot](https://github.com/ZIZO54619/rnaseq-parkinson-exploratory-pipeline/blob/main/reports/figures/PCA_3D.html)**

<p align="center">
  <img alt="PCA 3D preview" src="https://github.com/user-attachments/assets/03fc4d3c-e4be-4b07-860f-4324f9ac8af7" width="750" />
</p>

---

## 🔥 Heatmaps — Top Variable Genes

To explore gene-level expression patterns, the **top 100 most variable genes** were selected based on variance across all samples.  
These genes often capture the strongest biological signals, making them ideal for visualization.

### 1️⃣ Heatmap — Top 100 Most Variable Genes

This heatmap displays the expression of the most informative genes across all samples:

- Highlights global expression trends  
- Reveals potential Parkinson-associated clusters  
- Some samples clearly shift toward PD-like patterns  

<p align="center">
  <img alt="Top 100 variable genes heatmap" src="https://github.com/user-attachments/assets/c3a672d8-cad5-4625-a3a6-6a8a279e4319" width="700" />
</p>

---

### 2️⃣ Z-score Heatmap — Normalized Expression

Z-score normalization allows comparison of gene expression **relative to each gene’s mean**, revealing:

- Up- and down-regulated gene clusters  
- PD-associated signatures  
- Annotation-driven structure  

Each sample is annotated using:

- 🟥 PD vs 🟦 Control  
- 🚹 / 🚺 Gender  
- Age scale (white → black)  

<p align="center">
  <img alt="Z-score heatmap" src="https://github.com/user-attachments/assets/5a3168cc-5113-4cdf-aa8b-85770856cc7d" width="700" />
</p>

---

### 3️⃣ 3D Z-score Heatmap

A 3D visualization of the Z-score matrix adds a more geometric view of sample structure and gene activation patterns.

<p align="center">
  <img alt="Z-score 3D heatmap" src="https://github.com/user-attachments/assets/00f5a0fb-7261-4a21-9c29-f7d095e537b2" width="550" />
</p>

---

## 🧠 Biological Interpretation

### 1️⃣ Sample clustering & cohort separation

Across PCA and heatmap visualizations, Parkinson (PD) samples consistently separate from Control samples. This suggests:

- Strong underlying transcriptional differences  
- Disease-driven expression signatures  
- Minimal detectable batch effects  
- High-quality preprocessing and normalization  

---

### 2️⃣ Top variable genes highlight disease-relevant patterns

The top 100 most variable genes reveal:

- Gene clusters up-regulated in PD samples  
- Blocks with higher expression in controls  
- Patterns compatible with neuroinflammation / neuronal dysfunction signals frequently reported in Parkinson’s disease  

Z-score normalization further amplifies these contrasts and shows stable grouping patterns that agree with the PCA results.

---

### 3️⃣ Annotation insights (age, gender, sample type)

Using sample annotations in the Z-score heatmap:

- **Sample type (PD vs Control)** is the primary driver of clustering  
- **Gender** does not strongly impact the global structure  
- **Age** shows mild gradients but no major confounding effect  

This supports that the dominant source of variation is the disease status.

---

### 4️⃣ Potential misclassification

One sample behaves more like the PD cluster across:

- PCA 2D and 3D  
- Z-score heatmap patterns  

This may indicate:

- Metadata mislabeling  
- A prodromal / PD-like transcriptomic profile  
- Hidden phenotype or clinical history  

Such findings emphasize the value of exploratory analysis before downstream modeling and differential expression.

---

## 🧱 Project Structure

```text
rnaseq-parkinson-exploratory-pipeline/
├─ R/
│  ├─ 00_packages.R          # Load all required R packages
│  ├─ 01_load_data.R         # Read expression + phenotype, basic checks
│  ├─ 02_qc_plots.R          # Boxplots, density curves, histograms
│  ├─ 03_pca_analysis.R      # PCA 2D and 3D
│  ├─ 04_heatmaps.R          # Top variable genes & heatmaps
│  └─ run.R                  # Main script that runs the full pipeline
│
├─ data/
│  └─ raw/
│     ├─ Parkinson_exp.txt               # Expression matrix
│     └─ Parkinson_phenotable.txt        # Phenotype / metadata
│
├─ configs/
│  ├─ paths.yml              # Input / output paths
│  └─ params.yml             # Analysis parameters (e.g., top_n_genes)
│
├─ reports/
│  └─ figures/               # All generated plots (PDF/PNG/HTML)
│
├─ results/                  # (optional) Additional numeric outputs
└─ README.md
```

---

## ▶️ How to Run the Pipeline

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ZIZO54619/rnaseq-parkinson-exploratory-pipeline.git
   cd rnaseq-parkinson-exploratory-pipeline
   ```

2. **Open R / RStudio and set the working directory:**

   ```r
   setwd("path/to/rnaseq-parkinson-exploratory-pipeline")
   ```

3. **Run the main script:**

   ```r
   source("R/run.R")
   ```

All figures will be generated under:

```text
reports/figures/
```

You can then open the static PNG/PDF plots or interactive HTML (e.g., `PCA_3D.html`) directly from that folder.

---

## 📦 Requirements

* **R** ≥ 4.4  
* Main R packages:

  * ComplexHeatmap  
  * circlize  
  * tidyverse  
  * ggplot2  
  * ggfortify  
  * plotly  
  * htmlwidgets  
  * readr  

Packages can be installed with:

```r
install.packages(c("tidyverse", "ggplot2", "ggfortify", "plotly", "htmlwidgets", "readr"))

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("ComplexHeatmap", "circlize"))
```

> 💡 For full reproducibility, consider using `renv` or `packrat` to snapshot the R package versions.

---

## 🧪 Reproducibility & Notes

- Scripts are modular and can be adapted to other case–control RNA-Seq datasets.  
- The number of top variable genes (default = 100) can be tuned via `configs/params.yml`.  
- All plots are generated programmatically to make the workflow reproducible and version-controlled.

---

## 🚀 Future Directions

Possible next steps building on this exploratory pipeline:

- Differential expression analysis (DESeq2 / edgeR) between PD and Control  
- Pathway / gene set enrichment (e.g., Reactome, GO, KEGG)  
- Integration with clinical features (disease duration, progression scores…)  
- Extension to **multi-omics** (methylation, proteomics, etc.) using a similar structured pipeline  

---

## ✍️ Author

**Abdulaziz Mohamed**  
Biomedical Engineering & Bioinformatics  
GitHub: [ZIZO54619](https://github.com/ZIZO54619)

---

## 📜 License

This project is released for educational and research purposes.  
Feel free to reuse or extend the code with proper attribution.
