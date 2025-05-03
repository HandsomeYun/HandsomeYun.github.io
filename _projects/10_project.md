---
layout: page
title: Benchmarking Infrastructure-Based Sensor Placement
description: A flexible benchmarking framework supporting any sensor configuration for optimizing infrastructure-based perception.
img: assets/img/detection.png
importance: 3
category: technical
---

## Overview

The **Simulation & Benchmarking framework** provides a scalable and adaptable approach for evaluating **infrastructure-based multi-modal sensor placement** in autonomous driving. Unlike traditional vehicle-mounted benchmarking frameworks, which assume fixed sensor setups, our framework **supports any sensor configuration** and **flexibly adapts to diverse infrastructure environments**.

## Defining an Infrastructure Unit (IU)

We introduce the concept of an **Infrastructure Unit (IU)** to systematically model sensor groupings in heterogeneous environments. An IU is defined as:

$$
\text{IU} = \left\{ s \in \mathcal{S} \ \middle|\
\forall s_i, s_j \in \mathbf{IU}, \quad
\sqrt{(x_i - x_j)^2 + (y_i - y_j)^2} \leq 2m, \quad
|z_i - z_j| \leq 4m, \quad
p_i = p_j
\right\}
$$

where:

- $$s$$ represents a sensor,
- $$\mathcal{S}$$ is the set of all sensors in the environment,
- Sensors within an IU have **spatial proximity constraints**:
  - **Horizontal separation** ≤ **2 meters**
  - **Vertical separation** ≤ **4 meters**
  - **Identical sensor properties** $$(p_i = p_j)$$
    This IU-based formulation enables a structured approach for comparing different sensor deployments across diverse urban environments.

## Illustration of Sensor Placement Strategies

To ensure comprehensive sensor placement evaluation, we analyze three types of sensor arrangements across various intersection designs:

- **(a) Centralized Placement:** Sensors are concentrated near the intersection center, similar to **V2XSet**.
- **(b) Semi-Distributed Placement:** Sensors are more evenly distributed, resembling **DAIR-V2X** and **RCooper**.
- **(c) Fully Distributed Placement:** Sensors are spread across the entire intersection, aligning with **V2X-Real**.

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/InSPE.png" title="Illustration of Sensor Placement Strategies" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Three types of sensor placements: (a) Centralized (b) Semi-Distributed (c) Fully Distributed. The **Field of View (FOV) direction** represents the camera orientation.
</div>

## HM Perception Framework

Our benchmarking approach follows the **Heterogeneous Multi-Modal (HM) Perception Framework**, which integrates information from **distributed LiDAR and camera sensors** deployed at intersections. This framework is designed to **adaptively fuse data** from infrastructure sensors using a **heterogeneous 3D graph representation**, ensuring robust perception in urban environments.

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/benchmarking.png" title="HM Perception Framework" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    The HM Perception Framework integrates heterogeneous sensor nodes in a 3D graph to facilitate cooperative multi-modal perception.
</div>

**Framework Components:**

1. **Heterogeneous 3D Graph Representation**: Models the relationship between **LiDAR and camera nodes**.
2. **LiDAR Backbone**: Extracts **3D spatial features** and shares them across sensors.
3. **Camera Backbone**: Performs **3D feature reconstruction** using multi-view information.
4. **Feature Fusion Mechanism**: Combines sensor information to improve **object detection and tracking**.

## Simulation & Benchmarking Framework

To evaluate sensor placement effectiveness, we leverage **large-scale simulations in CARLA**, generating diverse environmental scenarios including:

- **Intersection Types**: Urban, rural, and highway intersections.
- **Environmental Conditions**: Different lighting, weather, and traffic densities.
- **Infrastructure Sensor Layouts**: Supports **arbitrary sensor distributions**, including centralized, distributed, and adaptive configurations.

## Benchmarking Results

We evaluated multiple perception models under **varying sensor distributions**, demonstrating:

- **Higher perception accuracy in heterogeneous sensor deployments** compared to traditional fixed setups.
- **Infrastructure-aware sensing significantly reduces occlusion and enhances detection rates** in complex intersections.
- **Flexible IU-based configurations improve sensor utilization** and enable adaptive sensor planning strategies.

### **Quantitative Results (NuScenes mAP %)**

We tested various sensor arrangements in the **Infra-Set dataset**, benchmarking across different object categories:

<div class="column">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/benchmarkresult.png" title="Infrastructure-Aware Benchmarking" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Benchmarking heterogeneous sensor placements across various intersection types in CARLA.
</div>

### **Key Takeaways**

- **Flexible IU-based sensor placement outperforms rigid setups** by dynamically adapting to different intersection structures.
- **Multi-modal sensor fusion (LiDAR + Camera) enhances object detection performance** in occluded environments.
- **Distributed and heterogeneous sensor configurations significantly improve pedestrian and cyclist detection**, critical for urban safety.

## Applications

- **Smart Intersection Planning**: Optimizing infrastructure sensor networks for **real-time traffic monitoring**.
- **Adaptive Perception Systems**: Deploying **dynamically reconfigurable sensor layouts** for improved V2X applications.
- **Scalable Benchmarking**: Providing a **standardized evaluation framework** for next-generation cooperative perception research.
