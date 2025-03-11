---
layout: page
title: Multi-Modal Infrastructure Sensor Placement Evaluation
description: A perception-driven framework for optimizing sensor placement at intersections using heterogeneous multi-modal sensing.
img: assets/img/InSPE.png
importance: 1
category: technical
---

## Overview  
The **InSPE** project introduces a framework for optimizing **multi-modal infrastructure sensor placement** at intersections, addressing challenges posed by **diverse intersection geometries, occlusions, and varying environmental conditions**. This research enhances **cooperative perception** by systematically evaluating sensor effectiveness.

## Key Components  
- **Perception Metrics**: Integrates **sensor coverage, perception occlusion, and information gain** to quantify sensor placement impact.  
- **Infrastructure Dataset**: Introduces **Infra-Set**, a dataset covering diverse intersection types and environmental conditions.  
- **Simulation & Benchmarking**: Performs large-scale evaluation using the **CARLA** simulator to assess sensor configurations.

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/InSPE-1.png" title="Sensor Placement Evaluation Framework" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Sensor Placement Evaluation Framework: HM Perception framework refers to heterogeneous multi-modal perception framework.
</div>

## Paper Submission  
This research is submitted to **ICCV 2025** and presents a **scalable, cost-effective solution** for optimizing intelligent infrastructure sensor placement.

### **Abstract**  
Infrastructure sensing is vital for **traffic monitoring at safety hotspots** (e.g., intersections) and serves as the **backbone of cooperative perception** in autonomous driving. While vehicle sensing has been extensively studied, **infrastructure sensing has received little attention**, especially given the unique challenges posed by **diverse intersection geometries, complex occlusions, varying traffic conditions, and environmental factors** such as lighting and weather.  

To address these issues and ensure **cost-effective sensor placement**, we propose **Heterogeneous Multi-Modal Infrastructure Sensor Placement Evaluation (InSPE)**, a **perception surrogate metric set** that rapidly assesses **perception effectiveness** across diverse infrastructure and environmental scenarios with **various multi-modal sensor combinations**.  

**InSPE systematically evaluates perception capabilities** by integrating three carefully designed metrics:  
1. **Sensor Coverage**  
2. **Perception Occlusion**  
3. **Information Gain**  

To support **large-scale evaluation**, we develop a **data generation tool within the CARLA simulator** and introduce **Infra-Set**, a dataset that covers **diverse intersection types and environmental conditions**. Benchmarking experiments using **state-of-the-art perception algorithms** demonstrate that **InSPE enables efficient and scalable sensor placement analysis**, providing a robust solution for **optimizing intelligent intersection infrastructure**.
