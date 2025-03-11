---
layout: page
permalink: /cookings/
title: cookings
description: A collection of my favorite recipes, exploring diverse culinary traditions from around the world, including Chinese, Western, fusion, and desserts.
nav: true
nav_order: 5
---

<style>
  /* Gallery Styling */
  .gallery {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    padding: 20px;
  }
  .gallery-item {
    margin: 20px;
    text-align: center;
  }
  .gallery-item img {
    width: 280px;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
  }
  .gallery-item img:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
  .category-heading {
    text-align: center;
    font-size: 1.5rem;
    margin-top: 40px;
  }
</style>

<h2 class="category-heading">Chinese</h2>
<div class="gallery">
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/chinese/' and image.extname != '.webp' %}
      <div class="gallery-item">
        <img src="{{ image.path | relative_url }}" alt="Chinese Dish">
      </div>
    {% endif %}
  {% endfor %}
</div>

<h2 class="category-heading">Dessert</h2>
<div class="gallery">
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/dessert/' and image.extname != '.webp' %}
      <div class="gallery-item">
        <img src="{{ image.path | relative_url }}" alt="Dessert">
      </div>
    {% endif %}
  {% endfor %}
</div>

<h2 class="category-heading">Fusion</h2>
<div class="gallery">
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/fusion/' and image.extname != '.webp' %}
      <div class="gallery-item">
        <img src="{{ image.path | relative_url }}" alt="Fusion Dish">
      </div>
    {% endif %}
  {% endfor %}
</div>

<h2 class="category-heading">Western</h2>
<div class="gallery">
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/western/' and image.extname != '.webp' %}
      <div class="gallery-item">
        <img src="{{ image.path | relative_url }}" alt="Western Dish">
      </div>
    {% endif %}
  {% endfor %}
</div>
