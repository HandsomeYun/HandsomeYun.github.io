---
layout: page
title: Face Clustering with PCA and K-Medoids
description: dimensionality reduction and face clustering using Principal Component Analysis (PCA) and K-Medoids on the LFW dataset
img: assets/img/pca.png
importance: 5
category: fun
---

In this project, I worked on exploring the LFW (Labeled Faces in the Wild) dataset by applying Principal Component Analysis (PCA) for dimensionality reduction. The project involved visualizing the top eigenfaces, reconstructing images using different numbers of principal components, and clustering the dataset with K-Means and K-Medoids algorithms. Through these methods, I evaluated the performance of clustering based on purity scores and execution times, enabling me to compare the effectiveness of each clustering technique on face image data.

Additionally, I investigated the influence of dimensionality reduction on clustering performance and identified the most and least discriminative pairs of face images using K-Medoids. By limiting the dataset to specific classes, I visualized and analyzed how well clustering algorithms performed in grouping similar faces. The project demonstrates a strong understanding of image representation, PCA, and unsupervised learning techniques, culminating in insights into which features and algorithms are best suited for face clustering tasks.

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/pcapairs.png" title="flow chart" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Most and least discriminative pairs of face images
</div>

