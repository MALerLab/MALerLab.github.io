---
layout: home
permalink: /members/
excerpt: "Members of MALer Lab"
---

## Professor
<div class="grid member-cards">
{% for prof in site.data.members-info.members-prof %}
    <div class="card member-card member-card-prof">
        {% if prof.image %}
        <div class="member-image">
            <img src="{{ site.url }}/assets/images/{{ prof.image }}" alt="{{ prof.name }}">
        </div>
        {% endif %}
        <div class="member-info">
            <div class="member-header">
                <h3>
                    {% if prof.name_en %}
                    <span class="name-en">{{ prof.name_en }}</span>
                    <span class="name-ko">{{ prof.name_ko }}</span>
                    {% else %}
                    {{ prof.name }}
                    {% endif %}
                </h3>
            </div>
            {% if prof.descriptions %}
            <div class="member-descriptions">
                <ul>
                {% for description in prof.descriptions %}
                    <li>{{ description }}</li>
                {% endfor %}
                </ul>
            </div>
            {% endif %}
        </div>

    </div>
{% endfor %}
</div>

<br/>

## PhD Student
<div class="grid member-cards">
{% for member in site.data.members-info.members-phd %}
    <div class="card member-card">
        <div class="member-info">
            <div class="member-header">
                <h3>
                    {% if member.name_en %}
                    <span class="name-en">{{ member.name_en }}</span>
                    <span class="name-ko">{{ member.name_ko }}</span>
                    {% else %}
                    {{ member.name }}
                    {% endif %}
                </h3>
                {% if member.website %}
                <span class="separator">|</span>
                <div class="member-links">
                    {% assign website_type = member.website | type_of %}
                    {% if website_type == 'string' %}
                    <a href="{{ member.website }}" target="_blank" class="btn-link">Website</a>
                    {% else %}
                    {% for link in member.website %}
                    <a href="{{ link[1] }}" target="_blank" class="btn-link">{{ link[0] }}</a>
                    {% endfor %}
                    {% endif %}
                </div>
                {% endif %}
            </div>
            {% if member.role %}
            <p class="member-role">{{ member.role }}</p>
            {% endif %}
            {% if member.interests %}
            <div class="member-interests">
                <strong>Fields of Research</strong>
                <ul>
                {% for interest in member.interests %}
                    <li>{{ interest }}</li>
                {% endfor %}
                </ul>
            </div>
            {% endif %}
        </div>
        {% if member.image %}
        <div class="member-image">
            <img src="{{ site.url }}/assets/images/{{ member.image }}" alt="{{ member.name }}">
        </div>
        {% endif %}
    </div>
{% endfor %}
</div>

<br/>

## Master's Student
<div class="grid member-cards">
{% for member in site.data.members-info.members-ms %}
    <div class="card member-card">
        <div class="member-info">
            <div class="member-header">
                <h3>
                    {% if member.name_en %}
                    <span class="name-en">{{ member.name_en }}</span>
                    <span class="name-ko">{{ member.name_ko }}</span>
                    {% else %}
                    {{ member.name }}
                    {% endif %}
                </h3>
                {% if member.website %}
                <span class="separator">|</span>
                <div class="member-links">
                    {% assign website_type = member.website | type_of %}
                    {% if website_type == 'string' %}
                    <a href="{{ member.website }}" target="_blank" class="btn-link">Website</a>
                    {% else %}
                    {% for link in member.website %}
                    <a href="{{ link[1] }}" target="_blank" class="btn-link">{{ link[0] }}</a>
                    {% endfor %}
                    {% endif %}
                </div>
                {% endif %}
            </div>
            {% if member.role %}
            <p class="member-role">{{ member.role }}</p>
            {% endif %}
            {% if member.interests %}
            <div class="member-interests">
                <strong>Fields of Research</strong>
                <ul>
                {% for interest in member.interests %}
                    <li>{{ interest }}</li>
                {% endfor %}
                </ul>
            </div>
            {% endif %}
        </div>
        {% if member.image %}
        <div class="member-image">
            <img src="{{ site.url }}/assets/images/{{ member.image }}" alt="{{ member.name }}">
        </div>
        {% endif %}
    </div>
{% endfor %}
</div>

{% if site.data.members-info.members-researcher.size > 0 %}
<br/>

## Researcher
<div class="grid member-cards">
{% for member in site.data.members-info.members-researcher %}
    <div class="card member-card">
        <div class="member-info">
            <div class="member-header">
                <h3>
                    {% if member.name_en %}
                    <span class="name-en">{{ member.name_en }}</span>
                    <span class="name-ko">{{ member.name_ko }}</span>
                    {% else %}
                    {{ member.name }}
                    {% endif %}
                </h3>
                {% if member.website %}
                <span class="separator">|</span>
                <div class="member-links">
                    {% assign website_type = member.website | type_of %}
                    {% if website_type == 'string' %}
                    <a href="{{ member.website }}" target="_blank" class="btn-link">Website</a>
                    {% else %}
                    {% for link in member.website %}
                    <a href="{{ link[1] }}" target="_blank" class="btn-link">{{ link[0] }}</a>
                    {% endfor %}
                    {% endif %}
                </div>
                {% endif %}
            </div>
            {% if member.role %}
            <p class="member-role">{{ member.role }}</p>
            {% endif %}
            {% if member.interests %}
            <div class="member-interests">
                <strong>Fields of Research</strong>
                <ul>
                {% for interest in member.interests %}
                    <li>{{ interest }}</li>
                {% endfor %}
                </ul>
            </div>
            {% endif %}
        </div>
        {% if member.image %}
        <div class="member-image">
            <img src="{{ site.url }}/assets/images/{{ member.image }}" alt="{{ member.name }}">
        </div>
        {% endif %}
    </div>
{% endfor %}
</div>

<br/>
{% endif %}

## Alumni
<div class="grid member-cards">
{% for member in site.data.members-info.members-alumni %}
    <div class="card member-card">
        <div class="member-info">
            <div class="member-header">
                <h3>
                    {% if member.name_en %}
                    <span class="name-en">{{ member.name_en }}</span>
                    <span class="name-ko">{{ member.name_ko }}</span>
                    {% else %}
                    {{ member.name }}
                    {% endif %}
                </h3>
                {% if member.website %}
                <span class="separator">|</span>
                <div class="member-links">
                    {% assign website_type = member.website | type_of %}
                    {% if website_type == 'string' %}
                    <a href="{{ member.website }}" target="_blank" class="btn-link">Website</a>
                    {% else %}
                    {% for link in member.website %}
                    <a href="{{ link[1] }}" target="_blank" class="btn-link">{{ link[0] }}</a>
                    {% endfor %}
                    {% endif %}
                </div>
                {% endif %}
            </div>
            {% if member.role %}
            <p class="member-role">{{ member.role }}</p>
            {% endif %}
            {% if member.interests %}
            <div class="member-interests">
                <strong>Fields of Research</strong>
                <ul>
                {% for interest in member.interests %}
                    <li>{{ interest }}</li>
                {% endfor %}
                </ul>
            </div>
            {% endif %}
        </div>
        {% if member.image %}
        <div class="member-image">
            <img src="{{ site.url }}/assets/images/{{ member.image }}" alt="{{ member.name }}">
        </div>
        {% endif %}
    </div>
{% endfor %}
</div>
