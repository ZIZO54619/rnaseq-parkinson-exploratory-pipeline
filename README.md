# 🧬 RNA-Seq Exploratory Analysis — Parkinson’s Dataset

This repository contains a complete exploratory RNA-seq workflow applied to a Parkinson vs Control dataset.
The pipeline includes data loading, quality control, PCA, and heatmap-based visualization of the most variable genes.

---

## 📌 Graphical Abstract  

<img width="1132" height="636" alt="image" src="https://github.com/user-attachments/assets/e4c9ba06-c24a-435c-981e-7e8e2ed5fc4a" />

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
  <img src="https://github.com/ZIZO54619/rnaseq-parkinson-exploratory-pipeline/blob/main/reports/figures/Box%20Plot.pdf" width="600">
</p>
<img width="1287" height="410" alt="image" src="https://github.com/user-attachments/assets/881b9ce7-4047-4ce8-bf31-0f3b6a689d2c" />

---

### **2️⃣ Density Plot — Checking distribution alignment**
Density curves help evaluate whether samples follow a similar global distribution.  
Misaligned density shapes may indicate:
- technical artifacts  
- poor quality samples  
- scaling issues

<p align="center">
  <img src="PATH_TO_YOUR_IMAGE/Density plot.pdf" width="600">
</p>

---

### **3️⃣ Histogram — Per-sample gene expression**
Histograms allow inspecting the full distribution shape for each sample.

<p align="center">
  <img src="PATH_TO_YOUR_IMAGE/Histogram_plot.pdf" width="600">
</p>

<p align="center">
  <img src="PATH_TO_YOUR_IMAGE/Histograms_all_samples.pdf" width="600">
</p>

---
