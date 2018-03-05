---
layout: default
title: Publications
permalink: /papers/
weight: 4
---

## Published articles

{% assign act_year = site.time | date: '%Y' %}

{% for pub_year in (2006..act_year) reversed %}
  <h3 style="text-align:right;"> {{ pub_year }} </h3>
  <ul>
  {% bibliography --query @article[year = {{ pub_year }}]  %}
  </ul>
{% endfor %}
