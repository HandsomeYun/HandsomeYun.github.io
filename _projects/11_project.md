---
layout: page
title: Misalignment-Adapted Multi-Agent Perception
description: A novel framework for mitigating multi-modality misalignment in cooperative autonomous driving using cross-modality feature alignment.
img: assets/img/Agent.png
importance: 2
category: technical
---

## Overview

**AgentAlign** is a **misalignment-adapted multi-agent perception framework** designed to enhance **inter-agent sensor correlations** in cooperative autonomous driving. While **cooperative perception** offers significant advantages by leveraging shared information across **Connected Automated Vehicles (CAVs)** and smart infrastructure, **multi-modality sensor misalignment** remains a major challenge. AgentAlign dynamically harmonizes features across multiple sensing modalities, **improving detection and robustness in real-world multi-agent scenarios**.

## Key Contributions

- **Cross-Modality Feature Alignment (CFAS)**: Introduces a shared feature space to **dynamically harmonize heterogeneous sensor measurements** across different agents.
- **Heterogeneous Agent Feature Alignment (HAFA)**: Addresses **multi-modality sensor misalignment** by modeling agent-specific feature dependencies.
- **V2XSet-Noise Dataset**: A new dataset that **simulates real-world sensor imperfections**, enabling a controlled evaluation of robustness in cooperative perception models.
- **Benchmarking & Evaluation**: Demonstrates **state-of-the-art performance** on **V2X-Real** and **V2XSet-Noise**, establishing a new standard for **resilient inter-agent perception**.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/Agent-1.png" title="Cross-Modality Feature Alignment Framework" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Cross-Modality Feature Alignment (CFAS) framework for mitigating sensor misalignment in multi-agent settings.
</div>

## Paper Submission

This research has been submitted to **ICCV 2025** and is under review. The paper provides **new insights and solutions** for improving **multi-agent cooperative perception** in autonomous driving.

### **Abstract**

Cooperative perception has attracted wide attention due to its ability to **leverage shared information across CAVs** and smart infrastructure, addressing **sensing occlusion and range limitations**. However, **existing research overlooks the fragile multi-sensor correlations** in multi-agent settings, where **heterogeneous sensor measurements are highly susceptible to environmental noise**, weakening inter-agent sensor interactions.

The varying operational conditions introduce **multifactorial noise**, leading to **multi-sensor misalignment** and making **multi-agent, multi-modality perception deployment challenging** in real-world applications. To tackle this issue, we propose **AgentAlign**, a **real-world heterogeneous agent cross-modality feature alignment framework** that dynamically harmonizes **multi-modality features across different agents**.

Our framework introduces:

1. **Cross-Modality Feature Alignment (CFAS)** to **unify heterogeneous sensor features**.
2. **Heterogeneous Agent Feature Alignment (HAFA)** to **enhance inter-agent feature consistency**.
3. **V2XSet-Noise Dataset**, simulating **realistic sensor imperfections** for benchmarking model robustness.

Extensive experiments on **V2X-Real** and **V2XSet-Noise** benchmarks demonstrate that **AgentAlign achieves state-of-the-art performance**, highlighting its potential for **real-world cooperative autonomous driving applications**. The **V2XSet-Noise dataset and generation pipeline** will be publicly released.
