---
layout: home
permalink: /members/
excerpt: "Members of MALer Lab"
---

## > Professor
{% for prof in site.data.members-info.members-prof %}
<section class="profile">
    <img src="{{ site.baseurl }}/assets/images/{{ prof.image }}" alt="{{ prof.name }}" style="width:20%">
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
<br/>

{% for role in site.data.members %}
## > {{ role.name }}

{% assign members = site.data.members-info[role.yaml_dir] %}

{% for member in members %}
{% if member.website %}
- **{{ member.name }}**
{% if member.role %} ({{ member.role }}) {% endif %} / [Website]({{ member.website }})
{% else %}
- **{{ member.name }}**
{% if member.role %} ({{ member.role }}) {% endif %}
{% endif %}
{% endfor %}
<br/>
{% endfor %}

