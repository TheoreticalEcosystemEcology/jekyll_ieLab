---
layout: default
title: Papers
permalink: /papers/
weight: 4
---


## Papers

### In review

<ol>{% bibliography --query @*[status = review] %}</ol>

### In press
<ol>
{% bibliography --query @*[status = press] %}
</ol>

### Published

{% assign act_year = site.time | date: '%Y' %}

{% for pub_year in (2006..act_year) reversed %}
  <h3 style="text-align:right;"> {{ pub_year }} </h3>
  <ol>
  {% bibliography --query @*[year = {{ pub_year }} && status != review && status != press]  %}
  </ol>
{% endfor %}
