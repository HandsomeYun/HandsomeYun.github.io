---
layout: page
title: Trajectory Modification Tool
description: Part of the U.S. DOT Intersection Safety Challenge
img: assets/img/traj.jpg
importance: 3
category: fun
---

The **Trajectory Modification Tool** was developed as part of the <a href="https://its.dot.gov/isc/"> U.S. DOT Intersection Safety Challenge</a>. It is designed to improve intersection safety by allowing human users to modify the trajectory data generated by LiDAR sensors. The tool enables manual verification and adjustment of trajectories, ensuring higher accuracy for subsequent perception and evaluation teams. The tool was developed under a tight deadline of just three weeks, with numerous feature requests added at the last minute, and it plays a crucial role in streamlining the workflow of trajectory data for safe and effective intersection management.

## Key Features:
- **Manual Trajectory Adjustments**: The tool allows users to:
    - Add, delete, connect, and disconnect points.
    - Smooth the trace of cars.
    - Fit a group of randomly scanned data by LiDAR points to still points, ensuring the data is accurate and reliable for downstream tasks.
- **Time Format Transformation**: It converts the ground truth time format into a more intuitive Year/Date/Hour/Minute/Second format, making it easier for users to work with and understand the data.
- **Data Output for Further Analysis**: The tool generates trajectory data formats suitable for use by the perception team, evaluation tasks, and LiDAR point analysis.
- **User-Friendly Features**: To enhance usability, we added several intuitive features, including:
    - Keyboard shortcuts for faster editing and adjustments.
    - The ability to scroll to zoom in/out, allowing users to easily navigate large datasets.
    - Quick cut, add, and edit functions that streamline the modification process, enabling efficient handling of trajectory data.


<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/trajectory_full.jpg" title="Demo lidar camera" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Demo of trajectory modification tool used in the U.S. Department of Transportation Intersection Safety Challenge
</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/GWEVjEMRPQI?si=ZBGWNHUy-JOlWIrF" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>