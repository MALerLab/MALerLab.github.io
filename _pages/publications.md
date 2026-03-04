---
layout: home
permalink: /publications/
excerpt: "Publications of MALer Lab"
---

<div class="publications">
{%- assign groups = site.data.publications | group_by: "year" | sort: "name" | reverse %}
{%- for group in groups %}
<h2>{{ group.name }}</h2>
<ul>
{%- for paper in group.items %}
<li>{{ paper.title }}
<ul>
<li>{{ paper.authors | markdownify | remove: '<p>' | remove: '</p>' | strip }}</li>
<li><em>{{ paper.venue }}</em></li>
{%- if paper.note %}
<li>{{ paper.note }}</li>
{%- endif %}
{%- if paper.links %}
<li>{{ paper.links | markdownify | remove: '<p>' | remove: '</p>' | strip }}</li>
{%- endif %}
</ul>
</li>
{%- endfor %}
</ul>
{%- endfor %}
</div>
