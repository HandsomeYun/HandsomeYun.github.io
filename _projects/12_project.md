---
layout: page
title: Surrogate Metrics for Infrastructure-Based Perception Evaluation
description: A structured approach for quantifying sensor effectiveness in infrastructure-based perception.
img: assets/img/InSPE.png
importance: 1
category: technical
---

## Overview  
To systematically evaluate the effectiveness of **infrastructure-based multi-modal sensor placement**, we introduce **surrogate metrics** that quantify sensor perception performance. These metrics enable a structured assessment of different sensor configurations across diverse environmental conditions.

This page details the design of **perception coverage, perception occlusion, and information gain metrics**, which serve as key performance indicators in **infrastructure-based perception evaluation**. For more details on the implementation and benchmarking framework, see [Simulation & Benchmarking for Infrastructure-Based Sensor Placement](_projects/10_project.md).

---

## Camera and LiDAR Sensing Modeling  
To evaluate the sensing capability of multi-modal sensor placements at intersections, we introduce a **ray-cast sensing model** for camera and LiDAR. This approach builds upon prior work \cite{hu2022investigating,li2024influence} and employs the **Bresenham algorithm** \cite{bresenham1998algorithm} to efficiently compute the sensor’s **view frustum** or **sensing range** under a given placement $$ P_0 $$:

$$
    \Omega | P_0 = \{V_1^{P_0},V_2^{P_0},...,V_n^{P_0}, n \in N\}
$$

### **Camera Sensing Model**  
We model the camera's **field of view (FoV)** as a frustum using the **pinhole camera model** \cite{hartley2003multiple}. Each pixel in the image corresponds to a **ray projection model**, linking real-world coordinates $$ P(p_x, p_y, p_z) $$, the image pixel $$ p(h_i, w_j) $$, and the camera principal point $$ O^C(c_x, c_y) $$. 

The camera ray equation is defined as:

$$
    r_{ij}^{C}(\mu) = O^C + \mu \cdot d_{ij} = O^C + \mu \cdot 
    \begin{bmatrix}
    (w_{j} - c_x)/f \$$6pt]
    (h_{i} - c_y)/f \$$6pt]
    1
    \end{bmatrix}
$$

where $$ \mu \geq 0 $$, and $$ d_{ij} $$ is the ray direction.

### **LiDAR Sensing Model**  
LiDAR sensing is modeled using **discrete beam emission**, where each beam is a ray emanating from the LiDAR origin $$ O^L $$, with direction defined by **horizontal scanning angle $$ \theta^L $$** and **vertical scanning angle $$ \psi^L $$**:

$$
    r^{L}_{ij}(t) = O^L + t\cdot d_{ij} = O^L + t
    \begin{bmatrix}
    \cos\psi^L_{i} \cos\theta^L_{j} \\
    \cos\psi^L_{i} \sin\theta^L_{j} \\
    \sin\psi^L_{i}
    \end{bmatrix}
$$

where $$ 0 \le t \le t_{\max} $$.

---

## Surrogate Metric Design  

### **Perception Coverage Metric**  
We define a **perception coverage metric $$ C $$** to quantify the effective sensing region of sensors in an intersection. Using the ray-cast sensor model:

$$
    f(V_i) =
    \begin{cases}
    1, & \text{if sensor ray passes through } V_i, \\
    0, & \text{otherwise}
    \end{cases}
$$

The weighted perception coverage is computed as:

$$
$$

where $$ w(V_i) $$ represents importance weights assigned to different intersection regions, following safety prioritization from \cite{gattis2010guide,mcmahon2002analysis,kim2024enhancing}.

---

### **Perception Occlusion Metric**  
To measure the occlusion effect caused by objects (e.g., vehicles, pedestrians), we introduce an **occlusion probability metric $$ O $$**. This metric integrates a **waypoint-based bounding box traffic model**, defining occluded regions based on vehicle positions and trajectories.

The occlusion ratio for a given waypoint frame $$ k $$ is:

$$
    O^{(k)} = \frac{|V_{\text{occ}}^{(k)}|}{|V_{\text{orig}}^{(k)}|}
$$

where $$ V_{\text{orig}}^{(k)} $$ represents the original visible region, and $$ V_{\text{occ}}^{(k)} $$ is the occluded subset. The total occlusion probability is then computed as:

$$
    O = \frac{1}{N} \sum_{k=1}^{N} 1 - \frac{|V_{\text{occ}}^{(k)}|}{|V_{\text{orig}}^{(k)}|}
$$

---

## Illustration of Camera and LiDAR Sensing  
To visually demonstrate the perception models, we present the following illustrations:

\begin{figure}[t]
\centering
\begin{minipage}[b]{0.3\textwidth}
  \centering
  \includegraphics[width=\textwidth]{sections/figs/camera_sensing_model.png}
  \subcaption{Camera View Frustum Model}
  \label{fig:sensing_a}
\end{minipage}
\hfill
\begin{minipage}[b]{0.48\textwidth}
  \centering
  \includegraphics[width=\textwidth]{sections/figs/lidar_sensing_model.png}
  \subcaption{Mechanical and Solid-State LiDAR Model}
  \label{fig:sensing_b}
\end{minipage}
\caption{\textbf{Illustration of Camera and LiDAR Sensing Models.} The red dot represents the sensor center, and the orange lines indicate camera and LiDAR rays.}
\label{fig:sensing}
\end{figure}

---

## Summary  
This page introduces the **design of surrogate metrics** for infrastructure-based perception evaluation, focusing on:  
- **Perception Coverage**: Measuring sensor effectiveness in different spatial regions.  
- **Perception Occlusion**: Capturing occlusion effects caused by dynamic objects.  

These metrics provide a structured approach for assessing sensor placement strategies. For a full evaluation of benchmarking experiments and sensor placement strategies, refer to [Simulation & Benchmarking for Infrastructure-Based Sensor Placement](_projects/10_project.md).
