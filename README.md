# Optic Disc Segmentation from Fundus Images

## Project Overview
This project focuses on segmenting the Optic Disc (OD) from retinal fundus images using image processing techniques. The objective is to automatically identify OD regions and evaluate segmentation performance against manual annotations provided by medical experts.

This work was conducted as part of the course **EB3206**.

---

## Dataset
The dataset used is a subset of the **Drishti-GS dataset** from Aravind Eye Hospital, India.

- Contains **30 pairs** of retinal images:
  - RGB fundus images
  - Binary ground truth (manual OD segmentation by doctors)

### Data Split:
- **20 images** → Training  
- **10 images** → Testing  

### Ground Truth:
- Pixel value `1` → Optic Disc (OD)  
- Pixel value `0` → Non-OD  

---

## Methodology

### 1. Preprocessing
- Red channel extraction  
- Gaussian filtering  
- Blood vessel removal  
- Thresholding  
- Morphological operations  

### 2. Localization
- Region of Interest (ROI) detection to locate the optic disc  

### 3. Segmentation
- Binary segmentation of OD region  
- Post-processing using morphological techniques  

### 4. Evaluation
- ROI efficiency  
- F1-score (before and after ellipse fitting)

---

## Evaluation Metrics

- **F1 Score**  
  - Before ellipse fitting  
  - After ellipse fitting  

- **ROI Efficiency**  
  - Measures localization accuracy  

---

## Project Structure

### Folder A – Localization
- Contains cropped images of the Region of Interest (ROI) corresponding to the detected Optic Disc (OD) area.

### Folder B – Segmentation
- Contains binary images representing the segmentation results of the Optic Disc (OD), where pixel values indicate OD and non-OD regions.

### Folder C – Contour
- Contains contour visualization results of the Optic Disc (OD) overlaid on the original RGB fundus images.

### Report File
- Includes the project report (PDF format) describing the methodology, experiments, and evaluation results.

### Source
- Contains all MATLAB source code used in this project, including preprocessing, localization, segmentation, and evaluation processes.

---
