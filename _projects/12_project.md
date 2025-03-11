---
layout: page
title: Surrogate Metrics for Infrastructure-Based Perception Evaluation
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


## Overview  
The **Simulation & Benchmarking framework** evaluates the impact of **multi-modal sensor placement** strategies using large-scale simulations in **CARLA**. This framework provides a scalable method to analyze **sensor coverage, occlusion, and fusion strategies** in various intersection geometries and environmental conditions.

## Simulation Environment  
We use the **CARLA simulator** to generate a realistic urban environment for benchmarking infrastructure-based sensing strategies.  
- **Intersection Diversity**: The dataset includes **10 unique intersections** across urban, rural, and highway settings.  
- **Environmental Conditions**: Scenarios vary in **lighting, weather, and traffic densities**, ensuring realistic sensor evaluation.  
- **Multi-Modal Sensor Configurations**: Different **camera and LiDAR placements** are tested to assess **cooperative perception effectiveness**.

## Benchmarking Framework  
We compare multiple **sensor placement strategies** using the following setups:

- **Centralized Sensors (Cam-c, L-c)**: Sensors positioned at **a single fixed location**.
- **Distributed Sensors (Cam-d1, Cam-d2, L-d1, L-d2)**: Sensors spread across **multiple locations** for better coverage.
- **Hybrid Configurations (Cam-d1/L-d1, Cam-d2/L-d2)**: Combining **camera and LiDAR** for **multi-modal fusion**.

## Results & Findings  
Experiments demonstrate that:
- **LiDAR-enhanced placements** outperform **camera-only setups**, especially in long-range perception.
- **Distributed sensor networks** reduce occlusion by up to **40% compared to centralized setups**.
- **Camera-LiDAR fusion models** improve detection accuracy in **high-density traffic conditions**.

## Applications  
- **Smart Intersection Deployment**: Improving **infrastructure planning** for **connected autonomous systems**.  
- **Multi-Agent Perception**: Enhancing **real-time object detection** using **V2X communication**.  
- **Scalable Sensor Benchmarking**: Providing a **standardized dataset** for **future cooperative perception research**.

---
