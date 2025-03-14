---
## Interests and Goals
My research interests are in the areas of wireless communications, information theory, and decentralized learning, with an emphasis on massive random access, privacy of federated learning, age of information, MIMO, and noncoherent communications.

My goal is to gain fundamental insights into communication and learning systems and to leverage these insights for practical designs of communication and learning schemes.

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
## Theses

* [M.Sc.] Nam Nguyen, “On Minimizing Symbol Error Probability Using Beamforming in MIMO Gaussian Wiretap
Channels”, Department of Electrical Engineering and Computer Science, Oregon State University, United States, Dec. 2024. 

* [B.Eng] Nam Nguyen, “Performance Enhancement of Satellite-based Free-Space Quantum Key Distribution Systems using Key Retransmission and Relaying Techniques”, Department of Telecommunications Engineering, Posts and Telecommunications Institute of Technology, Vietnam, Mar. 2021. 
