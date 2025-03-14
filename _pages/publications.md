---
layout: archive
title: "Research"
permalink: /publications/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
  {: .text-justify}
{% endfor %}

---
## Interests and Goals
My research interests are in the areas of wireless communications, information theory, and decentralized learning, with an emphasis on massive random access, privacy of federated learning, age of information, MIMO, and noncoherent communications.

My goal is to gain fundamental insights into communication and learning systems and to leverage these insights for practical designs of communication and learning schemes.
