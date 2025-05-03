---
layout: page
title: RelMap - Enhancing Online Map Generation via Relation-Aware Learning
description: A novel Transformer-based approach for enhancing online map generation with relation-aware learning.
img: assets/img/relmap_overview.png
importance: 3
category: research
---

## Overview

**RelMap** introduces a **relation-aware learning approach** for enhancing **online map generation**. Traditional online mapping methods struggle with **noisy observations, missing information, and weak relational reasoning**. RelMap addresses these challenges by incorporating **spatial and contextual relationships** between detected objects, significantly improving **mapping accuracy and robustness**.

## Key Contributions

- **Relation-Aware Learning**: Integrates object-object and object-environment relationships to enhance **spatial reasoning**.
- **Transformer-Based Architecture**: Utilizes **self-attention** to refine mapping predictions with contextual dependencies.
- **Efficient Online Learning**: Demonstrates superior performance even with **limited training data**.
- **State-of-the-Art Performance**: Outperforms existing methods on **benchmark datasets**, improving both **precision and recall**.

---

## Model Architecture

RelMap employs a **Transformer-based pipeline** to capture high-level **spatial dependencies** between scene elements. It consists of:

1. **Feature Extraction** - Processing sensor data (LiDAR, cameras, radar).
2. **Relation-Aware Transformer** - Modeling **object-object** and **object-environment interactions**.
3. **Semantic Map Decoder** - Generating a **structured map representation** in real time.

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/relmap_architecture.png" title="RelMap Model Architecture" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    RelMap's architecture integrates relation-aware learning into online mapping.
</div>

---

## Benchmarking & Performance

RelMap is evaluated on **multiple datasets** and achieves **state-of-the-art** performance compared to existing online mapping approaches.

### **Quantitative Benchmark Results**

The model achieves **higher mAP and F1 scores**, demonstrating significant improvements over baseline methods.

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/relmap_benchmark.png" title="Benchmarking RelMap Against Other Models" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    RelMap achieves state-of-the-art performance in mapping accuracy.
</div>

### **Data Efficiency Study**

RelMap maintains **high performance even with limited training data**, making it more robust than previous approaches.

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/relmap_data_efficiency.png" title="Data Efficiency of RelMap" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    RelMap performs well even with reduced training data, showing strong generalization.
</div>

---

## Qualitative Results

The qualitative results highlight RelMap’s ability to **reduce noise, handle occlusions, and improve mapping clarity**.

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/relmap_qualitative.png" title="Qualitative Comparison of RelMap" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    RelMap produces clearer and more accurate maps compared to baselines.
</div>

---

## Applications

- **Autonomous Driving**: Enhancing **real-time map updates** for self-driving vehicles.
- **Smart Cities**: Improving **urban infrastructure mapping** and navigation.
- **Robotics**: Assisting robots in **environmental understanding** and path planning.

---

## Summary

RelMap introduces a **relation-aware approach** to **online map generation**, demonstrating **improved accuracy, robustness, and data efficiency**. With **Transformer-based learning**, it outperforms existing methods in **mapping precision and generalization**.

For more technical details, see the full **paper**.

---
