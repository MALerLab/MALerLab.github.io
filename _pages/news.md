---
layout: home
permalink: /news/
excerpt: "News of MALer Lab"
---

## News

<ul class="news-list">
{% for item in site.data.news %}
<li><span class="news-date">[{{ item.date }}]</span> {{ item.content | markdownify | remove: '<p>' | remove: '</p>' | strip }}
{%- if item.details %}
<ul><li>
<details>
<summary>{{ item.details.summary }}</summary>
{% if item.details.images %}
<div style="display:flex;flex-direction:row">
{% for img in item.details.images %}
<img src="{{ '/assets/images/' | append: img | relative_url }}" style="{{ item.details.image_style }}" align="center">
{% endfor %}
</div>
{% elsif item.details.html %}
{{ item.details.html }}
{% endif %}
</details>
</li></ul>
{%- endif %}
</li>
{% endfor %}
</ul>
