---
layout: page
title: V2XPnP - Vehicle-to-Everything Spatio-Temporal Fusion
description: A novel intermediate fusion framework for V2X multi-agent perception and prediction.
img: assets/img/v2xpnp.png
importance: 4
category: technical
---

## Overview

**V2XPnP** is a novel **Vehicle-to-Everything (V2X) spatio-temporal fusion framework** designed for cooperative multi-agent **perception and prediction**. Unlike prior works focusing on single-frame cooperative perception, **V2XPnP** integrates **spatio-temporal fusion** and introduces a unified Transformer-based architecture to handle multi-agent interactions efficiently.

This project introduces:

- **Intermediate fusion within one-step communication** to balance accuracy and transmission efficiency.
- **V2XPnP Sequential Dataset**, a large-scale real-world dataset covering **vehicle-to-vehicle (V2V), vehicle-to-infrastructure (V2I), and infrastructure-to-infrastructure (I2I)** collaboration modes.
- **Comprehensive benchmarks** across 11 fusion models for cooperative perception and prediction.

For full details, refer to our publication.

---

## V2XPnP Framework

V2XPnP addresses three critical challenges in **V2X cooperative perception**:

1. **What to transmit?** Extends traditional fusion strategies (early, late, intermediate) into the temporal domain.
2. **When to transmit?** Introduces one-step and multi-step communication strategies for optimizing temporal data exchange.
3. **How to fuse?** Implements a **Transformer-based spatio-temporal fusion model** for end-to-end perception and prediction.

### Illustration of Fusion Strategies

**Different fusion strategies for V2X perception and prediction:**

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="/assets/img/fusion_strategies.png" title="flow chart" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fusion Strategies
</div>

- **Early Fusion**: Transmits raw sensor data for high fidelity but at the cost of bandwidth.
- **Late Fusion**: Transmits only detected objects, reducing data but losing fine-grained feature details.
- **Intermediate Fusion**: Transmits feature maps, achieving a **balance between data efficiency and accuracy**.

---

## V2XPnP Sequential Dataset

We introduce the **V2XPnP Sequential Dataset**, the first **large-scale real-world V2X dataset** that supports:

- **Multi-agent collaboration** (V2V, V2I, I2I)
- **Sequential frame-based perception and prediction**
- **100 vehicle-centric and infrastructure-centric scenarios**
- **40,000 frames** with detailed LiDAR, camera, and HD map data.

### Dataset Illustration

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="/assets/img/dataset.png" title="flow chart" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Dataset Illustration
</div>

**Data Collection Setup:**

- Utilizes **CAVs and Infrastructure sensors**
- Covers **urban, highway, and intersection environments**
- Provides **high-resolution vector maps for scene understanding**

---

## Experimental Results

We evaluate **V2XPnP** against state-of-the-art baselines, including **CoBEVFlow, FFNet, and V2X-ViT**.

### **Benchmark Comparison**

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="/assets/img/comparison.png.png" title="flow chart" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Dataset Illustration
</div>

### **Qualitative Results**

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="/assets/img/results.png" title="flow chart" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Qualitative Results
</div>
V2XPnP significantly improves detection and prediction accuracy, reducing **false positives and trajectory drift** compared to baseline models.

---

## Conclusion

V2XPnP **redefines cooperative V2X perception and prediction** by integrating spatio-temporal fusion, optimizing communication, and introducing a new benchmark dataset. **It sets a new state-of-the-art** for **multi-agent perception and trajectory forecasting**.
