---
layout: default
title: Old meetings
---

<div class="row">
  <div class="small-1 columns text-right" style="margin:0px;padding:0px;">
  <img src="/assets/img/brain.svg" alt="brain" style="height:50px">
</div>
  <div class="large-11 columns">
  <h2>The lab meetings<br><span style="font-weight:200;padding-top:20px;">Calendar of weekly meetings</span></h2>
</div>
  <div class="small-12 columns">

<div class="small-12 columns">
<table style="width:100%">

{% for lab-meetings in site.data.old_lab reversed %}

<tr>
  <td style="min-width:150px;">{{ lab-meetings.Date }}</td>
  <td style="min-width:150px;">{{ lab-meetings.Presenter }}</td>
  <td style="padding-top:20px;"><span style='font-weight:600;font-size:17px;'>{{ lab-meetings.Title }}</span> {% if lab-meetings.Link != blank %} <a href="{{ lab-meetings.Link }}"><i class="fi-link" aria-hidden="true"></i> <small>PDF</small></a> {% endif %}</td>
</tr>
{% endfor %}

</table>

</div>
