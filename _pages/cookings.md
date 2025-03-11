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
    font-family: var(--font-sans-serif);
    background-color: #6a0dad;
    color: white;
    border: 1px solid #6a0dad;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .filter-btn:hover {
    background-color: #5e0bb0;
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
    display: none; /* Hide all initially */
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
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
</style>

<!-- Selection Bar -->
<div id="category-selection">
  <button class="filter-btn" onclick="filterSelection('all')" aria-label="Filter by All">Show All</button>
  <button class="filter-btn" onclick="filterSelection('chinese')" aria-label="Filter by Chinese">Chinese</button>
  <button class="filter-btn" onclick="filterSelection('dessert')" aria-label="Filter by Dessert">Dessert</button>
  <button class="filter-btn" onclick="filterSelection('fusion')" aria-label="Filter by Fusion">Fusion</button>
  <button class="filter-btn" onclick="filterSelection('western')" aria-label="Filter by Western">Western</button>
</div>

<!-- Image Gallery -->
<div class="gallery">
  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/chinese/' and (image.extname == '.jpg' or image.extname == '.png') %}
      {% assign file_path = image.path | relative_url %}
      
      <!-- Skip rendering if file does not exist -->
      {% if file_path != "" %}
        <div class="filter chinese">
          <img src="{{ file_path }}" alt="Chinese Dish">
        </div>
      {% endif %}
    {% endif %}
  {% endfor %}

  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/dessert/' and image.extname == '.jpg' or image.extname == '.png' %}
      <div class="filter dessert">
        <img src="{{ site.baseurl }}{{ image.path }}" alt="Dessert">
      </div>
    {% endif %}
  {% endfor %}

  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/fusion/' and image.extname == '.jpg' or image.extname == '.png' %}
      <div class="filter fusion">
        <img src="{{ site.baseurl }}{{ image.path }}" alt="Fusion Dish">
      </div>
    {% endif %}
  {% endfor %}

  {% for image in site.static_files %}
    {% if image.path contains '/assets/img/cooking/western/' and image.extname == '.jpg' or image.extname == '.png' %}
      <div class="filter western">
        <img src="{{ site.baseurl }}{{ image.path }}" alt="Western Dish">
      </div>
    {% endif %}
  {% endfor %}
</div>

<script>
  function filterSelection(category) {
    var items = document.getElementsByClassName("filter");

    for (var i = 0; i < items.length; i++) {
      items[i].style.display = "none"; // Hide all items
      if (category === "all" || items[i].classList.contains(category)) {
        items[i].style.display = "block"; // Show matched category
      }
    }
  }

  // Show all images by default on page load
  document.addEventListener("DOMContentLoaded", function () {
    filterSelection("all");
  });
</script>
