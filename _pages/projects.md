---
title: Projects
permalink: /projects/
layout: home
excerpt: "Projects of MALer Lab"
---

{% assign featured = site.projects | where: "featured", true | sort: "priority" | reverse %}
{% assign other = site.projects | where_exp: "project", "project.featured != true" | sort: "updated_at" | reverse %}

<h2 style="margin-bottom: 1.5rem;">Featured Projects</h2>
<div class="grid project-grid">
  {% for project in featured %}
    {% include project-card.html project=project %}
  {% endfor %}
  {% if featured.size == 0 %}
    <p>No featured projects yet.</p>
  {% endif %}
</div>

<br/>
{% if other.size > 0 %}
<div class="grid project-grid">
  {% for project in other %}
    {% include project-card.html project=project %}
  {% endfor %}
</div>
{% endif %}


