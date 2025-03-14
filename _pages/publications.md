---
layout: archive
title: "Research"
permalink: /publications/
author_profile: true
---

---
## Interests 
My research interests lie at the intersection of Information Theory and Machine Learning, with an emphasis on rate-distortion-perception-classification representation for lossy compression. I am also deeply engaged in wireless communications, physical layer security, and advanced MIMO systems, combining theoretical insights with practical applications.

Research Interests:
+ Intersection of information theory and machine learning: Rate-distortion-perception-classification representation for lossy compression, neural data compression, representation learning.

+ Wireless communications and networks: Channel capacity, signal processing, optimization, and machine learning for advanced MIMO communication systems, physical layer security for MIMO, beamforming techniques, wireless networking and technology for 5G/6G.

+ Free-space quantum key distribution networks: Design, analysis, and optimization of link-layer retransmissions and relaying techniques.

---
## Research Experience


---
## Publications
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
