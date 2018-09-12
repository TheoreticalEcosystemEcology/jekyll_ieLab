---
layout: default
title: Meetings
menu: main
permalink: /meetings/
weight: 10
---

<div class="row">
  <div class="small-1 columns text-right" style="margin:0px;padding:0px;">
  <img src="/assets/img/lambda.svg" alt="lambda" style="height:50px">
</div>
  <div class="large-11 columns">
  <h3>Les midis numériques<br><span style="font-weight:300;padding-top:10px;">Calendrier des activités</span></h3>
</div>
  <div class="small-12 columns">
  <p>
L'objectif de ces rencontres est de présenter des avancées numériques et méthodologiques pertinentes en écologie et évolution. Ces avancées doivent être suffisamment transversales pour permettre de réunir les groupes de recherche en écologie végétale et animale autour d'une même table. La forme choisie est informelle et adaptée au sujet de manière à maximiser les échanges entre les participants.
</p>

<hr>
<div class="small-12 columns">
<table style="width:100%">

{% for meeting in site.data.meetings reversed %}
<tr>
<td style="min-width:150px;"><strong>{{ meeting.Date }}</strong></td>
<td style="padding-top:20px;"><strong>{{ meeting.Title }}</strong> par {{ meeting.Presenter }}<br>
<hr style="margin:5px;">
<p>{{ meeting.Abstract }}<br><strong>Documents à lire</strong>:
{% for doc in meeting.Documents %}
  <a href="../assets/pdf/midi_num/{{ doc }}"> {{ doc }} </a>
{% endfor %}</p>
</td>
</tr>
{% endfor %}


</table>

<div class="row">
  <div class="small-1 columns text-right" style="margin:0px;padding:0px;">
  <img src="/assets/img/brain.svg" alt="brain" style="height:50px">
</div>
  <div class="large-11 columns">
  <h3>The lab meetings<br><span style="font-weight:300;padding-top:20px;">Calendar of weekly meetings</span></h3>
</div>
  <div class="small-12 columns">
  <p>
The aim of these lab meetings is to promote discussion among members on all subjects related to ecology, mathematics and computer science.
The meetings are intended primarily for lab members, but everyone interested in the subject is welcome! The meetings will be held in D8-0022 at noon on the date in the table:
</p>

<div class="small-12 columns">
<table style="width:100%">

{% for lab-meetings in site.data.lab reversed %}

<tr>
  <td style="min-width:150px;"><strong>{{ lab-meetings.Date }}</strong></td>
  <td style="min-width:150px;">{{ lab-meetings.Presenter }}</td>
  <td style="padding-top:20px;">{{ lab-meetings.Title }} {% if lab-meetings.Link != blank %} <a href="{{ lab-meetings.Link }}"><i class="fi-link" aria-hidden="true"></i> <small>PDF</small></a> {% endif %}</td>
</tr>
{% endfor %}

</table>

</div>
