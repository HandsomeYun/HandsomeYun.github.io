---
layout: page
title: pyHFO
description: Multi-window desktop application providing time-efficient HFO detection algorithms for artifact and HFO with spike classification.
img: assets/img/pyHFO.jpg
importance: 5
category: work
---

# pyHFO: High-Frequency Oscillation (HFO) Detection Tool

## Overview  
PyHFO is a **multi-window desktop application** designed to provide a **time-efficient and accurate** solution for detecting **High-Frequency Oscillations (HFOs)** in EEG data. Developed at **Vwani Roychowdhury’s Lab at UCLA**, PyHFO integrates **advanced detection algorithms** to classify artifacts and **HFOs with spikes**, ensuring improved accuracy and efficiency for clinical and research applications.

One of PyHFO’s major advancements is its **Hilbert (HIL) detector**, which I contributed to developing and optimizing. By refining **signal processing methods** and leveraging **deep learning architectures**, PyHFO has significantly improved detection speeds while maintaining high accuracy.

[🔗 Explore the GitHub Repository](https://github.com/roychowdhuryresearch/pyHFO)

---

## Key Contributions  

### **1. Implementation of HFO and Artifact Detection Algorithms**  
- Developed and integrated the **Hilbert (HIL) detector** to enhance PyHFO’s ability to classify **HFOs, artifacts, and spikes** in EEG data.  
- Incorporated **Latent State (LS) detection** for **spindle detection**, expanding PyHFO’s analytical capabilities.  
- Optimized **VGG-based deep learning models** for neurobiomarker identification.  

### **2. Performance Optimization & Benchmarking**  
- Improved **detection run-time by a factor of 50**, achieving significant speed-ups compared to existing state-of-the-art models.  
- Conducted **comprehensive validation studies**, ensuring PyHFO maintained comparable accuracy despite faster execution times.  
- Benchmarked PyHFO against alternative solutions, refining algorithms for maximum efficiency.  

### **3. User-Centric Design & Multi-Window Interface**  
- Designed PyHFO as a **multi-window desktop application**, facilitating intuitive interaction for researchers and clinicians.  
- Implemented visualization tools to enable real-time signal processing and **comparative analysis** of detected HFO events.  
- Enhanced usability by integrating **dynamic EEG signal representation**, supporting both raw and processed data views.  

---

## **Technical Approach & Features**  

### **Deep Learning for EEG Analysis**
- **VGG-based deep learning model** used for artifact classification and signal feature extraction.  
- Integration of **Hilbert Transform-based frequency analysis** for precise HFO detection.  

### **Multi-Agent Signal Processing**
- **Multi-modal filtering techniques** for differentiating between **true HFOs, artifacts, and noise**.  
- Advanced **time-series segmentation** for EEG pattern recognition.  

### **Optimized Detection Workflow**
- Reduced **computational overhead**, allowing real-time processing of EEG data.  
- Adaptive **thresholding techniques** for robust event classification.  

---

## **Impact & Future Work**
PyHFO provides **clinicians and researchers** with a **fast, reliable, and interpretable** tool for detecting neural oscillations, which are critical in understanding conditions such as **epilepsy**.  

### **Future Directions**
- Integration of **real-time EEG data streaming** for live monitoring and detection.  
- Expansion to detect **other neurobiomarkers**, including **sleep spindles and K-complexes**.  
- Further **deep learning enhancements** to refine classification accuracy.  

---

## **Visual Representation**
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/pyHFO_use.jpg" title="Overview of PyHFO Interface" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This is the user interface of PyHFO, showcasing its multi-window design for efficient EEG data analysis.
</div>



---

## **Explore More**
- **GitHub Repository**: [🔗 PyHFO](https://github.com/roychowdhuryresearch/pyHFO)  
- **Related Work**: EEG Signal Processing, HFO Detection, Neural Biomarkers  

---
