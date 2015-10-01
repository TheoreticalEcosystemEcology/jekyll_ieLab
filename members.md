---
layout: default
title: Members
permalink: /members/
weight: 5
---

<div class="row">
  <div class="large-12 columns">
    <h2> Principal investigator </h2>
  </div>
</div>

<div class="row valign-middle">
  {% for member in site.data.members %}
  {% if member.Status == 'Principal investigator' %}
  <div class="small-6 columns text-right ">
    <img src="/assets/img/members/{{ member.Image }}" alt="{{ member.Name }}" class="circular"/>
  </div>
  <div class="small-6 columns text-left">
    <h5  style="font-weight:600;"> {{ member.Name }} {{ member.LastName }} </h5>
  </div>
  {% endif %}
  {% endfor %}
</div>

<div class="row">
  <div class="large-12 columns">
    <h2> Members</h2>
  </div>
</div>

{% assign members = (site.data.members | sort: 'Name') %}
{% assign cur_year = site.time | date: '%Y' | times: 1%}

{% for member in  members %}
{% if member.Status != 'Principal investigator' and member.Year_finish >= cur_year %}

<div class="row" style="padding-top:50px;">
  <div class="large-3 columns text-right ">
    <img src="/assets/img/members/{{ member.Image }}" alt="{{ member.Name }}" class="circular" />
  </div>
  <div class="large-9 columns text-left">
    <h5 style="font-weight:600;"> {{ member.Name }} {{ member.LastName }}  <br> <span style="font-weight:400;font-size:15px;margin-top:20px;">{{ member.Status }} ({{ member.Year_start }}-{{ member.Year_finish }})</span> </h5>
    <h6 style="font-weight:600;">{{ member.Title }}</h6>
    <h6 style="font-weight:600;font-size:14px;"> Supervisor(s): <span style="font-weight:400;font-size:14px;"> {{ member.Supervisor }},   {{ member.CoSupervisor }}</span></h6>
    <p style="text-align:right;margin-right:25px;">

      <a href="mailto:{{ member.Email }} "> <i class="step fi-mail" style="font-size: 30px;"></i> </a>
      {%if member.Github != blank %}
      <a href="http://github.com/{{ member.Github }}"> <i class="step fi-social-github" style="font-size: 30px;"></i>
      </a> {% endif %}
      {%if member.Website != blank %}
      <a href="http://{{ member.Website }}/"> <i class="step fi-web" style="font-size: 30px;"></i>
      </a> {% endif %}
    </p>

    <dl class="accordion" data-accordion>
      <dd class="accordion-navigation">
        <a href="#panel{{ member.key }}a">Abstract</a>
        <div id="panel{{ member.key }}a" class="content active">
          <p>
            {{ member.Abstract_fr}}
          </p>
        </div>
      </dd>
      <dd class="accordion-navigation">
        <a href="#panel{{ member.key }}b">Publications</a>
        <div id="panel{{ member.key }}b" class="content active">
          {% bibliography --query @*[author ~= {{ member.LastName }}] --template bib_member %}
        </div>
      </dd>
    </dl>

  </div>
</div>
{% endif %}
{% endfor %}

<!-- ALUMNI -->
<div class="row">
  <div class="large-12 columns">
    <h2> Alumni</h2>
  </div>
</div>

{% for member in  members %}
{% if member.Status != 'Principal investigator' and member.Year_finish < cur_year %}

<div class="row" style="padding-top:50px;">
  <div class="large-3 columns text-right ">
    <img src="/assets/img/members/{{ member.Image }}" alt="{{ member.Name }}" class="circular" />
  </div>
  <div class="large-9 columns text-left">
    <h5 style="font-weight:600;"> {{ member.Name }} {{ member.LastName }}  <br> <span style="font-weight:400;font-size:15px;margin-top:20px;">{{ member.Status }} ({{ member.Year_start }}-{{ member.Year_finish }})</span> </h5>
        <h6 style="font-weight:600;font-size:14px;"> Actual position: <span style="font-weight:400;font-size:14px;"> {{ member.Position }}</span></h6>

    <p style="text-align:right;margin-right:25px;">

      <a href="mailto:{{ member.Email }} "> <i class="step fi-mail" style="font-size: 30px;"></i> </a>
      {%if member.Github != blank %}
      <a href="http://github.com/{{ member.Github }}"> <i class="step fi-social-github" style="font-size: 30px;"></i>
      </a> {% endif %}
      {%if member.Website != blank %}
      <a href="http://{{ member.Website }}/"> <i class="step fi-web" style="font-size: 30px;"></i>
      </a> {% endif %}
    </p>

    <dl class="accordion" data-accordion>
      <dd class="accordion-navigation">
        <a href="#panel{{ member.key }}b">Publications</a>
        <div id="panel{{ member.key }}b" class="content active">
          {% bibliography --query @*[author ~= {{ member.LastName }}] --template bib_member %}
        </div>
      </dd>
    </dl>

  </div>
</div>
{% endif %}
{% endfor %}
