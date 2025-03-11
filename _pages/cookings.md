---
layout: page
permalink: /cookings/
title: cookings
description: A collection of my favorite recipes, exploring diverse culinary traditions from around the world, including Chinese, Western, fusion, and desserts.
nav: true
nav_order: 5
---

<style>
  /* Category Selection Styling */
  #category-selection {
    text-align: center;
    margin-bottom: 20px;
  }

  .filter-btn {
    padding: 10px 15px;
    margin: 10px;
    font-size: 1rem;
    font-family: var(--font-sans-serif); /* Match al-folio font */
    background-color: #6a0dad; /* Purple background */
    color: white; /* White text */
    border: 1px solid #6a0dad; /* Matching border */
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .filter-btn:hover {
    background-color: #5e0bb0; /* Darker purple on hover */
    color: white;
  }

  /* Image Gallery Styling */
  .gallery {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    padding: 20px;
  }

  .filter {
    display: none; /* Hide images by default */
    margin: 20px;
    text-align: center;
  }

  .filter img {
    width: 280px;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
  }

  .filter img:hover {
    transform: scale(1.05); /* Zoom effect */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
</style>

<!-- Selection Bar -->
<div id="category-selection">
  <button class="filter-btn" onclick="filterSelection('all')">Show All</button>
  <button class="filter-btn" onclick="filterSelection('chinese')">Chinese</button>
  <button class="filter-btn" onclick="filterSelection('dessert')">Dessert</button>
  <button class="filter-btn" onclick="filterSelection('fusion')">Fusion</button>
  <button class="filter-btn" onclick="filterSelection('western')">Western</button>
</div>

<!-- Image Gallery -->
<div class="gallery">


  <!-- Loop for Dessert Category -->
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/dessert/' and image.extname != '.webp' %}
      <div class="filter dessert">
        <img src="{{ image.path | relative_url }}" alt="Dessert" width="300px">
      </div>
    {% endif %}
  {% endfor %}

  <!-- Loop for Fusion Category -->
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/fusion/' and image.extname != '.webp' %}
      <div class="filter fusion">
        <img src="{{ image.path | relative_url }}" alt="Fusion Dish" width="300px">
      </div>
    {% endif %}
  {% endfor %}

  <!-- Loop for Western Category -->
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/western/' and image.extname != '.webp' %}
      <div class="filter western">
        <img src="{{ image.path | relative_url }}" alt="Western Dish" width="300px">
      </div>
    {% endif %}
  {% endfor %}

</div>

<script>
  function filterSelection(category) {
    var items = document.getElementsByClassName("filter");
    if (category === "all") category = "";
    for (var i = 0; i < items.length; i++) {
      items[i].style.display = "none"; // Hide all images by default
      if (items[i].className.indexOf(category) > -1) {
        items[i].style.display = "block"; // Show matching images
      }
    }
  }

  // Show all images by default on page load
  filterSelection('all');
</script>
