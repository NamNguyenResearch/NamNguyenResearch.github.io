---
layout: archive
title: "Research"
permalink: /publications/
author_profile: true
---

---
## Interests 
My research interests lie at the intersection of information theory and machine learning, with an emphasis on rate-distortion-perception-classification representation for lossy compression. I am also deeply engaged in wireless communications, physical layer security, and advanced MIMO systems, combining theoretical insights with practical applications.

Research Areas:
+ **Intersection of information theory and machine learning:** Rate-distortion-perception-classification representation for lossy compression, neural data compression, representation learning.

+ **Wireless communications and networks:** Channel capacity, signal processing, optimization, and machine learning for advanced MIMO communication systems, physical layer security for MIMO, beamforming techniques, wireless networking and technology for 5G/6G.

+ **Free-space quantum key distribution networks:** Design, analysis, and optimization of link-layer retransmissions and relaying techniques.

---
## Research Experience

### Oregon State University, Communications and Signal Processing Group  
**Position:** Research Assistant  
**Duration:** Dec. 2022 – Present  
**Location:** Corvallis, OR, US  
**Advisors:** Prof. Thinh Nguyen and Prof. Bella Bose  
**Topics:**  
- Representation learning  
- Neural data compression  
- Statistical signal processing & Bayesian inference  
- Non-convex optimization  
- Wireless communications  
- Physical layer security  

### Project: Universal Rate-Distortion-Classification Representations for Lossy Compression  
- Developed a universal representation framework in lossy compression to handle multiple distortion-classification tradeoffs with a single encoder.  
- Proved the approximate achievability of the universal rate-distortion-classification function using theoretical information-theoretic methods.  
- Implemented and evaluated novel deep learning algorithms for classification-enhanced neural image compression models (using Autoencoder + GAN + CNN Classifier) on MNIST and SVHN datasets with PyTorch, achieving performance comparable to designing separate encoders for each objective.  
- **Outputs:** 1 conference paper submission and 1 journal paper manuscript.

### Project: Design and Security Analysis of Symbol Error Probability-Based Beamforming in MIMO Gaussian Wiretap Channels  
- Served as the lead researcher and first author on a paper addressing low-complexity, high-performance beamforming for Gaussian MIMO Wiretap Channels.  
- Formulated a mathematical model and PHY signal design (using binary antipodal signals and M-ary detection schemes) and proposed a novel low-complexity algorithm utilizing KKT conditions, generalized eigen decomposition, and projected gradient descent.  
- Conducted numerical experiments in MATLAB to evaluate the proposed beamforming scheme, analyzed results, and authored the paper.  
- **Outputs:** 1 published conference paper and 1 journal paper submission.

### Posts and Telecommunications Institute of Technology, Optical Communications Research Group  
**Position:** Research Assistant  
**Duration:** Mar. 2019 – Mar. 2023  
**Location:** Hanoi, Vietnam  
**Advisors:** Prof. Vuong Mai and Prof. Ngoc Dang  
**Topics:**  
- Free-space quantum key distribution (QKD) networks  
- Optical communication systems  

### Project: Design and Security Analysis of Satellite-Based Free-Space Quantum Key Distribution Systems for Wireless and Vehicular Networks  
**Sponsor:** National Foundation for Science and Technology Development (NAFOSTED, Vietnam)  
- Led research and served as the first author on four papers related to satellite-based free-space QKD systems for wireless networks.  
- Innovated by expanding terrestrial BPSK modulation/direct-detection QKD systems to satellite-based QPSK modulation/QKD systems.  
- Designed and analyzed satellite-based QKD systems, including aspects such as link-layer retransmissions, relaying techniques, and performance evaluations under atmospheric turbulence-induced phase fluctuations.  
- Executed numerical experiments in MATLAB to assess system performance, analyzed results, and authored multiple research papers.  
- **Outputs:** 2 published conference papers and 2 published journal papers.


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
