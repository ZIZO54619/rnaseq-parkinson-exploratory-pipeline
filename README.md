# 🧬 RNA-Seq Exploratory Analysis — Parkinson’s Dataset

This repository contains a complete exploratory RNA-seq workflow applied to a Parkinson vs Control dataset.
The pipeline includes data loading, quality control, PCA, and heatmap-based visualization of the most variable genes.

---

## 📌 Graphical Abstract  

<p align="center">
<img width="1132" height="636" alt="image" src="https://github.com/user-attachments/assets/e4c9ba06-c24a-435c-981e-7e8e2ed5fc4a" />
</p>

---

## 📁 Project Overview

This project performs:

- Preprocessing & Quality Control  
- Dimensionality Reduction (PCA 2D & 3D)  
- Feature Selection (Top variable genes)  
- Heatmap and Z-score visualization  
- Identification of potential biological patterns  

More sections will be added below.

---


## 🔍 Quality Control (QC)

Before applying PCA or selecting variable genes, quality control was performed to evaluate sample distribution, detect outliers, and ensure data consistency.

### **1️⃣ Boxplot — Expression distribution per sample**
The boxplot visualizes global gene expression distribution across all samples to check:
- library size differences  
- abnormal shifts  
- potential batch effects  

<p align="center">
<img width="824" height="636" alt="image" src="https://github.com/user-attachments/assets/b3a29e46-f441-4c03-a262-eda349901d75" />
</p>

---

### **2️⃣ Density Plot — Checking distribution alignment**
Density curves help evaluate whether samples follow a similar global distribution.  
Misaligned density shapes may indicate:
- technical artifacts  
- poor quality samples  
- scaling issues

<p align="center">
<img width="824" height="636" alt="image" src="https://github.com/user-attachments/assets/4a2e77c9-3539-4254-a363-73b6fd7373f0" />
</p>

---

### **3️⃣ Histogram — Per-sample gene expression**
Histograms allow inspecting the full distribution shape for each sample.

<p align="center">
<img width="636" height="636" alt="image" src="https://github.com/user-attachments/assets/8b21f342-5da3-4341-bc41-703e08a22e5c" />
</p>

<p align="center">
<img width="955" height="636" alt="image" src="https://github.com/user-attachments/assets/95a19399-1eb0-4225-8596-b1e8707d1425" />
</p>

---
---

## 🔷 Principal Component Analysis (PCA)

PCA was applied to explore natural sample structure, detect separation between Parkinson vs Control subjects, and identify potential outliers.

---

### **1️⃣ PCA 2D — Global sample separation**

The 2D PCA scatter plot shows:

- Clear separation between **PD** and **Control** samples  
- PC1 and PC2 together explain a large portion of variance  
- No strong batch effects  
- One sample (previously noted in QC) lies closer to PD cluster  
  → potential misclassification or hidden phenotype effect

<p align="center">
<img width="636" height="636" alt="image" src="https://github.com/user-attachments/assets/bf8ee7a4-df15-4b3b-9dbc-ccd99823efe5" />
</p>

---

### **2️⃣ PCA 3D — Interactive sample visualization**

A 3D PCA plot provides a deeper look at sample grouping.  
View the interactive HTML version directly:

👉 **[Open PCA_3D interactive plot](https://github.com/ZIZO54619/rnaseq-parkinson-exploratory-pipeline/blob/main/reports/figures/PCA_3D.html)**

<p align="center">
<img width="839" height="513" alt="image" src="https://github.com/user-attachments/assets/03fc4d3c-e4be-4b07-860f-4324f9ac8af7" />
</p>

---

---

## 🔥 Heatmaps — Top Variable Genes

To explore gene-level expression patterns, the **top 100 most variable genes** were selected based on variance across all samples.  
These genes often capture the strongest biological signals, making them ideal for visualization.

---

### **1️⃣ Heatmap — Top 100 Most Variable Genes**

This heatmap displays the raw expression of the most informative genes across all samples.

- Highlights global expression trends  
- Reveals potential Parkinson-associated clusters  
- Some samples clearly shift toward PD patterns

<p align="center">
<img width="636" height="636" alt="image" src="https://github.com/user-attachments/assets/c3a672d8-cad5-4625-a3a6-6a8a279e4319" />
</p>

---

### **2️⃣ Z-score Heatmap — Normalized Expression**

Z-score normalization allows comparison of gene expression **relative to each gene’s mean**, revealing:

- Up-/down-regulated clusters  
- PD-associated signatures  
- Age/gender/sample-type annotations  

Each sample is annotated using:
- 🟥 PD vs 🟦 Control  
- 🚹 / 🚺 Gender  
- Age scale (white → black)

<p align="center">
<img width="636" height="636" alt="image" src="https://github.com/user-attachments/assets/5a3168cc-5113-4cdf-aa8b-85770856cc7d" />
</p>

---

### **3️⃣ 3D Z-score Heatmap (Optional)**

A 3D visualization of the Z-score matrix adds a more geometric view of sample structure and gene activation patterns.

<p align="center">
<img width="2000" height="2000" alt="Z-score_heatmap3D" src="https://github.com/user-attachments/assets/00f5a0fb-7261-4a21-9c29-f7d095e537b2" />
</p>

---
