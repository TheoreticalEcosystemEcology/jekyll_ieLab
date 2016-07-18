---
layout: default
title: Papers
permalink: /papers/
weight: 4
---


## Papers

### In review

{% bibliography --query @*[status = review] %}

### In press

{% bibliography --query @*[status = press] %}

### Published

{% assign act_year = site.time | date: '%Y' %}

{% for pub_year in (2006..act_year) reversed %}
  <h3 style="text-align:right;"> {{ pub_year }} </h3>
  {% bibliography --query @*[year = {{ pub_year }} && status != review && status != press]  %}
{% endfor %}
