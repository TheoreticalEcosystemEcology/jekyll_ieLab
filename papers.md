---
layout: default
title: Papers
permalink: /papers/
weight: 4
---

{% assign  years = "2014,2013,2012,2011,2010" | split: "," %}

## Papers

### In review

{% bibliography --query @*[status = review] %}

### Published

{% for pub_year in years %}

<h3 style="text-align:right;"> {{ pub_year }} </h3>

{% bibliography --query @*[year={{ pub_year }} && status != review ]  %}

{% endfor %}
