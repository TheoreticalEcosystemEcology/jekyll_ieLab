---
layout: default
title: Members
menu: main
permalink: /members/
weight: 4
---

<div class="row">
  {% for member in site.data.members %}
  {% if member.Status == 'Principal investigator' %}
  <div class="small-6 columns text-right ">
    <img src="/assets/img/members/{{ member.Image }}" alt="{{ member.Name }}" class="circular"/>
  </div>
  <div class="small-6 columns text-left">
    <h5  style="font-weight:600; margin-top:75px;font-family:Public Sans;font-variant:small-caps;font-size:21px;margin-bottom:5px;"> {{ member.Name }} {{ member.LastName }} </h5>
    <p style="margin:0px;padding:0px;" >Principal investigator</p>
  </div>
  {% endif %}
  {% endfor %}
</div>

<div class="row">
  <div class="large-12 columns">
    <h2> Members</h2>
  </div>
</div>

{% assign members = site.data.members | sort: 'Name' %}
{% assign cur_year = site.time | date: '%Y' | times: 1%}

{% for member in  members %}
{% if member.Status != 'Principal investigator' and member.Year_finish >= cur_year or member.Status == "Professional researcher" %}

<div class="row" style="padding-top:50px;">
  <div class="large-3 columns text-right ">
    <img src="/assets/img/members/{{ member.Image }}" alt="{{ member.Name }}" class="circular" />
  </div>
  <div class="large-9 columns text-left">
    <h5 style="font-weight:600;font-family:Public Sans;font-variant:small-caps;font-size:21px;marging:0px;padding:0px;"> {{ member.Name }} {{ member.LastName }}</h5>
    <p style="margin-top:-5px;padding:0px;">{{ member.Status }} ({%if member.Year_start != blank %}{{ member.Year_start }}-{% endif %}{{ member.Year_finish }})</p>
    <h6 style="font-weight:600;">{%if member.Title_en != blank %} {{ member.Title_en}} {% else %} {{ member.Title_fr}} {% endif %}</h6>
    {%if member.Supervisor != blank %} <h6 style="font-weight:600;font-size:14px;"> Supervisor(s): <span style="font-weight:400;font-size:14px;"> {{ member.Supervisor }} {%if member.CoSupervisor != blank %}, {{ member.CoSupervisor }}{% endif %}</span></h6>{% endif %}
    <p style="text-align:left;margin-right:25px;">
      <a href="mailto:{{ member.Email }} "> <i class="step fi-mail" style="font-size: 20px;color:rgb(0, 99, 114)"></i> </a>
      {%if member.Twitter != blank %}
      <a href="http://twitter.com/{{ member.Twitter }}"> <i class="step fi-social-twitter" style="font-size: 20px;color:rgb(0, 99, 114)"></i>
      </a> {% endif %}
      {%if member.Github != blank %}
      <a href="http://github.com/{{ member.Github }}"> <i class="step fi-social-github" style="font-size: 20px;color:rgb(0, 99, 114)"></i>
      </a> {% endif %}
      {%if member.Website != blank %}
      <a href="http://{{ member.Website }}/"> <i class="step fi-web" style="font-size: 20px;color:rgb(0, 99, 114)"></i>
      </a> {% endif %}
    </p>

    <dl class="accordion" data-accordion>
      <dd class="accordion-navigation">
        <a href="#panel{{ member.key }}a">Research project</a>
        <div id="panel{{ member.key }}a" class="content">
          <p style="font-size:13px;">
            {%if member.Abstract_en != blank %} {{ member.Abstract_en}} {% else %} {{ member.Abstract_fr}} {% endif %}
          </p>
        </div>
      </dd>

      <dd class="accordion-navigation">
        <a href="#panel{{ member.key }}b">Publications</a>
        <div id="panel{{ member.key }}b" class="content">
          {% bibliography --query @*[author ~= {{ member.LastName }} && author ~= {{ member.Name }}] --template bib_member %}
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
{% if member.Status != 'Principal investigator' and member.Year_finish < cur_year%}

<div class="row" style="padding-top:50px;">
  <div class="large-3 columns text-right ">
    <img src="/assets/img/members/{{ member.Image }}" alt="{{ member.Name }}" class="circular" />
  </div>
  <div class="large-9 columns text-left">
    <h5 style="font-weight:600;font-family:Public Sans;font-variant:small-caps;font-size:21px;marging:0px;padding:0px;"> {{ member.Name }} {{ member.LastName }}</h5>
    <p style="margin-top:-5px;padding:0px;">{{ member.Status }} ({%if member.Year_start != blank %}{{ member.Year_start }}-{% endif %}{{ member.Year_finish }})</p>
    <h6 style="font-weight:600;font-size:14px;"> Next position: <span style="font-weight:400;font-size:14px;"> {{ member.Position }}</span></h6>

    <p style="text-align:left;margin-right:25px;">
      <a href="mailto:{{ member.Email }} "> <i class="step fi-mail" style="font-size: 20px;color:rgb(0, 99, 114)"></i> </a>
      {%if member.Twitter != blank %}
      <a href="http://twitter.com/{{ member.Twitter }}"> <i class="step fi-social-twitter" style="font-size: 20px;color:rgb(0, 99, 114)"></i>
      </a> {% endif %}
      {%if member.Github != blank %}
      <a href="http://github.com/{{ member.Github }}"> <i class="step fi-social-github" style="font-size: 20px;color:rgb(0, 99, 114)"></i>
      </a> {% endif %}
      {%if member.Website != blank %}
      <a href="http://{{ member.Website }}/"> <i class="step fi-web" style="font-size: 20px;color:rgb(0, 99, 114)"></i>
      </a> {% endif %}
    </p>

    <dl class="accordion" data-accordion>
      <dd class="accordion-navigation">
        <a href="#panel{{ member.key }}c" style="font-weight:600;">Publications & Collaborations</a>
        <div id="panel{{ member.key }}c" class="content">
          {% bibliography --query @*[author ~= {{ member.LastName }}] --template bib_member %}
        </div>
      </dd>
    </dl>

  </div>
</div>
{% endif %}
{% endfor %}
