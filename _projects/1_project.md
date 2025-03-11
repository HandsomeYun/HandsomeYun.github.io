---
layout: page
title: Multi-Modality Brain Tumor Segmentation
description: Leveraging MiniGPT-4 to enhance brain tumor segmentation through MRI modality fusion.
img: assets/img/Brain_tumour_segmentation.jpg
importance: 3
category: work
related_publications: false
---

## Overview

This project presents a novel approach to **brain tumor segmentation** by integrating **multiple MRI modalities** using **MiniGPT-4**. Traditional segmentation methods rely on **single-modality MRI scans** and often require significant **manual effort** or **technical expertise** to implement. By leveraging **MiniGPT-4**, we introduce a simple yet powerful **multi-modal segmentation framework** that fuses four distinct MRI modalities—**T1c, T1n, T2, and FLAIR**—for improved tumor detection and localization.

Our approach **enhances segmentation accuracy**, making it more accessible to medical professionals **without requiring coding experience**. The integration of these MRI modalities ensures **a comprehensive understanding of tumor structures**, significantly improving segmentation precision and reducing false positives.

---

## Key Innovations

1. **Multi-Modality Fusion:**

   - Combines **T1c, T1n, T2, and FLAIR MRI scans** to provide a more detailed and comprehensive view of brain tumors.
   - Reduces errors associated with single-modality segmentation models.

2. **Large Language Model (LLM) Integration:**

   - Utilizes **MiniGPT-4** to interpret both **visual and textual medical data**, ensuring **context-aware** tumor segmentation.
   - **Interactive chat-based interface** allows for seamless user interaction.

3. **Enhanced Preprocessing & Training Strategies:**

   - Custom preprocessing pipeline including **random rotation, flipping, and normalization** to improve model robustness.
   - **Fusion network integration** to synchronize tumor detection across MRI modalities.
   - **Projection layer adaptation** to enable **BioMedClip**, a biomedical visual encoder, to work with MiniGPT-4.

4. **Optimized Bounding Box Prediction:**
   - **Generalized IoU (GIoU) loss** ensures **precise tumor localization**, even when bounding boxes are initially misaligned.
   - **Smooth L1 loss** refines the predicted coordinates, balancing stability and accuracy.

---

## Results

Our **multi-modal segmentation framework** achieved a **200% increase in Intersection over Union (IoU)** compared to the baseline MiniGPT-4 model.

- **Single-image segmentation using default MiniGPT-4**: **IoU ~0.2**
- **Integration of BioMedClip visual encoder**: **150% relative IoU increase**
- **Improved preprocessing techniques**: **Further IoU gains**
- **Fusion network for four MRI modalities**: **10% additional IoU improvement**

The final model **significantly outperforms existing segmentation frameworks** while remaining **intuitive and easy to use**.

---

## Future Work

- **Incorporating SAM (Segment Anything Model):**
  - Utilize the predicted bounding boxes as inputs to **SAM** for generating refined tumor segmentation masks.
- **Integrating Patient Data:**
  - Explore the impact of **patient-specific data** on segmentation performance.
- **Optimizing Fusion Network:**
  - Further refining **modality synchronization** to enhance segmentation accuracy.

This research has profound implications for **automated medical imaging**, paving the way for more efficient, **LLM-assisted diagnostic tools** in clinical settings.

---

## Recognition & Impact

This work was presented at a **research symposium**, where it earned the **Best Presenter Award** and led to a **PhD offer with a Presidential Scholarship**. It highlights the **potential of AI-driven solutions** in medical imaging, offering **a more reliable and efficient** method for **brain tumor diagnosis and treatment planning**.

---

## View the Full Poster

<iframe src="/assets/pdf/brain_tumor_segmentation.pdf" width="100%" height="600px">
    This browser does not support PDFs. Please download the PDF to view it:
    <a href="/assets/pdf/brain_tumor_segmentation.pdf">Download PDF</a>
</iframe>
