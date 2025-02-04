---
layout: home
permalink: /members/
excerpt: "Members of MALer Lab"
---

## > Professor
{% for prof in site.data.members-info.members-prof %}
<section class="profile">
    <img src="{{ site.url }}/assets/images/{{ prof.image }}" alt="{{ prof.name }}" style="width:20%">
    <div class="profile-content">
        <ul>
        <h3>{{ prof.name }}</h3>
        {% for description in prof.descriptions %}
            <li>{{ description }}</li>
        {% endfor %}
        </ul>
    </div>
</section>
{% endfor %}

<br/>

{% for role in site.data.members %}
{% assign members = site.data.members-info[role.yaml_dir] %}
{% if members %}
<section class="member">
    <h2> > {{ role.name }}</h2>
    {% for member in members %}
    <ul>
        {% if member.website %}
        <li><strong>{{ member.name }}</strong>
        {% if member.role %} ({{ member.role }}) {% endif %} / <a href="{{ member.website }}" target="_blank">Website</a></li>
        {% else %}
        <li><strong>{{ member.name }}</strong>
        {% if member.role %} ({{ member.role }}) {% endif %}</li>
        {% endif %}
    </ul>
    {% endfor %}
</section>
{% endif %}


{% endfor %}


