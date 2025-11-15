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
