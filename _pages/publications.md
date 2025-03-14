---
layout: archive
title: "Research"
permalink: /publications/
author_profile: true
---

---
## Interests 
My research interests lie at the intersection of Information Theory and Machine Learning, with an emphasis on rate-distortion-perception-classification representation for lossy compression. I am also deeply engaged in wireless communications, physical layer security, and advanced MIMO systems, combining theoretical insights with practical applications.

Research Topics:
+ **Intersection of information theory and machine learning:** Rate-distortion-perception-classification representation for lossy compression, neural data compression, representation learning.

+ **Wireless communications and networks:** Channel capacity, signal processing, optimization, and machine learning for advanced MIMO communication systems, physical layer security for MIMO, beamforming techniques, wireless networking and technology for 5G/6G.

+ **Free-space quantum key distribution networks:** Design, analysis, and optimization of link-layer retransmissions and relaying techniques.

---
## Research Experience
Research Assistant, Communications and Signal Processing Group Dec. 2022 - Present
Oregon State University Corvallis, OR, US
Advisor: Prof. Thinh Nguyen and Prof. Bella Bose
Topics: Representation learning, neural data compression, statistical signal processing and Bayesian
inference, non-convex optimization, wireless communications, physical layer security.
Project: Universal rate-distortion-classification representations for lossy compression
+ Develop a universal representation framework in lossy compression to handle multiple distortion classification tradeoffs with a single encoder.
+ Prove the approximate achievability of the universal rate-distortion-classification function using theoretical information-theoretic methods.
+ Implement and evaluate novel deep learning algorithms for classification-enhanced neural image compression models (using Autoencoder + GAN + CNN Classifier) on MNIST/ SVHN datasets with PyTorch, showcasing minimal performance loss compared to designing separate encoders for each objective.
+ **Outputs:** 1 conference paper submission + 1 journal paper manuscript.

Project: Design and Security Analysis of Symbol Error Probability-based Beamforming in MIMO
Gaussian Wiretap Channels
+ Leading researcher and first author of 01 paper on low-complexity, high-performance symbol error probability minimization-based beamforming in Gaussian MIMO Wiretap Channels.
+ Formulated a mathematical model and PHY signal design (binary antipodal signals and M-ary detection schemes) and proposed a novel low-complexity algorithm utilizing KKT conditions, generalized eigen decomposition, and projected gradient descent.
+ Conducted numerical experiments in MATLAB to evaluate the proposed beamforming scheme, analyzed results, and authored the paper.
+ **Outputs:** 1 published conference paper and 1 journal paper submission [1], [2].

Research Assistant, Optical Communications Research Group Mar. 2019 - Mar. 2023
Posts and Telecommunications Institute of Technology Hanoi, Vietnam
Advisor: Prof. Vuong Mai and Prof. Ngoc Dang
Topics: Free-space quantum key distribution network, optical communication systems.
Project: Design and Security Analysis of Satellite-based Free-Space Quantum Key Distribution Systems
for Wireless and Vehicular Networks
Sponsor: National Foundation for Science and Technology Development (NAFOSTED, Vietnam)
+ Leading researcher and first author of 04 papers on satellite-based free-space quantum key distribution (QKD) systems for wireless networks.
+ Innovated project ideas by expanding terrestrial binary phase shift keying (BPSK) modulation/directdetection/QKD systems to satellite-based quadrature phase shift keying (QPSK) modulation/QKD systems.
+ Designed and analyzed satellite-based QKD systems, including link-layer retransmissions, relaying techniques, and performance evaluations under atmospheric turbulence-induced phase fluctuations.
+ Executed numerical experiments in MATLAB to assess system performance, analyzed results, and authored research papers.
+ **Outputs:** 2 published conference papers and 2 published journal papers [3], [4], [5], [6].

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

+ [M.Sc.] Nam Nguyen, “On Minimizing Symbol Error Probability Using Beamforming in MIMO Gaussian Wiretap
Channels”, Department of Electrical Engineering and Computer Science, Oregon State University, United States, Dec. 2024. 

+ [B.Eng] Nam Nguyen, “Performance Enhancement of Satellite-based Free-Space Quantum Key Distribution Systems using Key Retransmission and Relaying Techniques”, Department of Telecommunications Engineering, Posts and Telecommunications Institute of Technology, Vietnam, Mar. 2021. 
