---
layout: archive
title: "Research"
permalink: /publications/
author_profile: true
---

---
## Interests 
My research interests lie at the intersection of information theory and machine learning, with an emphasis on rate-distortion-perception-classification representation for lossy compression, and neural data compression.

Research Areas:
+ **Information theory and machine learning:** Lossy compression, rate-distortion-perception theory,
neural data compression, representation learning.
+ **Wireless communications and networks:** Channel capacity, signal processing, optimization, and machine learning for advanced MIMO communication systems, physical layer security for MIMO, beamforming, and channel coding.
+ **Free-space quantum key distribution networks:** Design, analysis, and optimization of link-layer retransmissions and relaying techniques.

---
## Research Experiences

### Oregon State University, Communications and Signal Processing Group  
**Position:** Research Assistant  
**Duration:** Mar. 2022 – Present  
**Location:** Corvallis, OR, US  
**Advisors:** Prof. Thinh Nguyen and Prof. Bella Bose  
**Topics:** Representation learning, neural data compression, statistical signal processing & Bayesian inference, non-convex optimization, wireless communications, physical layer security  

### Project: Cross-Domain Lossy Compression via Constrained Minimum Entropy Coupling
**Sponsor:** National Science Foundation (NSF) under Grant No. CCF:SHF:2417898
- Developed a cross-domain lossy compression framework based on minimum entropy coupling (MEC) with rate and classification constraints for task-aware reconstruction.
- Derived closed-form Bernoulli characterizations and established an equivalent deterministic coupling formulation under common randomness.
- Designed a neural restoration framework using quantization, entropy modeling, distribution matching, and classification regularization for super-resolution and denoising tasks.
- Built a PyTorch training and evaluation pipeline and benchmarked on MNIST (super-resolution) and SVHN (denoising) using classification accuracy, cross-entropy loss, and perceptual reconstruction metrics.
- **Outputs:** 1 conference paper submission [1].
  
### Project: Perception-based Image Denoising via Generative Compression
**Sponsor:** National Science Foundation (NSF) under Grant No. CCF:SHF:2417898
- Designed a perception-driven denoising framework using entropy-coded latent representations to control the rate-distortion-perception tradeoff.
- Developed two conditional generative-compression denoisers using GAN- and diffusion-based reconstruction to improve perceptual image quality.
- Built a PyTorch training and evaluation pipeline and benchmarked on Kodak/DIV2K (synthetic noise) and FMD/SIDD (real noise) using PSNR/SSIM and perceptual metrics.
- **Outputs:** 1 accepted conference paper [2].

### Project: Cross-Domain Lossy Compression via Rate- and Classification-constrained Optimal Transport 
**Sponsor:** National Science Foundation (NSF) under Grant No. CCF:SHF:2417898
- Developed a novel compression framework integrating bit-rate, distortion, classification, and perception constraints to improve robustness across domains.  
- Implemented deep learning models (VAE, W-GAN, CNN) with differentiable quantization and entropy-constrained losses for image super-resolution, denoising, and inpainting.
- Validated on MNIST, SVHN, CIFAR-10, ImageNet, and KODAK datasets, achieving strong alignment between theoretical tradeoffs and real-world performance.  
- **Outputs:** 1 accepted conference paper and 1 journal paper manuscript [3].

### Project: Rate-Distortion-Classification Representation Theory for Bernoulli Sources
**Sponsor:** National Science Foundation (NSF) under Grant No. CCF:SHF:2417898
- Developed a theoretical framework for task-oriented lossy compression by analyzing rate–distortion–classification (RDC) tradeoffs for Bernoulli sources under Hamming distortion.
- Derived closed-form expressions for one-shot RDC and distortion-rate-classification (DRC) functions using common randomness, enabling explicit characterization of optimal tradeoffs.
- Formulated the distortion–classification achievable region via representation-based analysis and solved its lower boundary using linear programming.
- Established universal encoder representation theory, deriving computable bounds on the minimum rate and quantifying the rate penalty for supporting multiple task objectives with a single encoder.
- **Outputs:** 1 accepted conference paper [4].

### Project: Universal Rate-Distortion-Classification Representations for Lossy Compression
**Sponsor:** National Science Foundation (NSF) under Grant No. CCF:SHF:2417898
- Developed a universal representation framework in lossy compression to handle multiple distortion-classification tradeoffs with a single encoder.  
- Proved the approximate achievability of the universal rate-distortion-classification function using theoretical information-theoretic methods.  
- Implemented and evaluated novel deep learning algorithms for classification-enhanced neural image compression models (using Autoencoder + GAN + CNN Classifier) on MNIST and SVHN datasets with PyTorch.
- **Outputs:** 1 accepted conference paper, 1 conference paper submission, and 1 journal paper submission [5], [6].

### Project: Design and Security Analysis of Symbol Error Probability-Based Beamforming in MIMO Gaussian Wiretap Channels  
- Served as the lead researcher and first author on a paper addressing low-complexity, high-performance beamforming for Gaussian MIMO Wiretap Channels.  
- Formulated a mathematical model and PHY signal design (using binary antipodal signals and M-ary detection schemes) and proposed a novel low-complexity algorithm utilizing KKT conditions, general eigenvalue problems, and Lagrange multiplier methods for beamforming optimization.
- Conducted numerical experiments in MATLAB to evaluate the proposed beamforming scheme, analyzed results, and authored the paper.  
- **Outputs:** 1 published conference paper and 1 journal paper submission [7], [8].

### Applied Artificial Intelligence Initiative, Deakin University  
**Position:** Machine Learning Research Intern  
**Duration:** July. 2025  
**Location:** Burwood, Australia   
**Advisors:** Prof. Mohamed Abdelrazek  

### Project: AI Agentic Negotiation   
- Conduct research on AI agentic negotiation, focusing on how large language models (LLMs) perform in multi-agent bargaining and argumentation scenarios under uncertainty.
- Identify and analyze key negotiation strategies from existing literature, and evaluate the capabilities of various LLMs in executing these strategies.
- Design experimental setups to simulate negotiation dialogues, incorporating belief updates, offer-counteroffer dynamics, and strategic reasoning

### Posts and Telecommunications Institute of Technology, Optical Communications Research Group  
**Position:** Research Assistant  
**Duration:** Mar. 2019 – Mar. 2023  
**Location:** Hanoi, Vietnam  
**Advisors:** Prof. Vuong Mai and Prof. Ngoc Dang  
**Topics:** Free-space quantum key distribution (QKD) networks, optical communication systems  

### Project: Design and Security Analysis of Satellite-Based Free-Space Quantum Key Distribution Systems for Wireless and Vehicular Networks  
**Sponsor:** National Foundation for Science and Technology Development (NAFOSTED, Vietnam), Grant No. 102.02-2019.08 
- Led research and served as the first author on four papers related to satellite-based free-space QKD systems for wireless networks.  
- Innovated by expanding terrestrial BPSK modulation/direct-detection QKD systems to satellite-based QPSK modulation/QKD systems.  
- Designed and analyzed satellite-based QKD systems, including aspects such as link-layer retransmissions, relaying techniques, and performance evaluations under atmospheric turbulence-induced phase fluctuations.
- Executed numerical experiments in MATLAB to assess system performance, analyzed results, and authored multiple research papers.  
- **Outputs:** 2 published conference papers and 2 published journal papers [9], [10], [11], [12].

---
## Publications
1. **Nam Nguyen**, Hassan Tavakoli, An Vuong, Thinh Nguyen, Bella Bose, "Cross-Domain Lossy Compression via Constrained Minimum Entropy Coupling," submitted to The 2026 IEEE Information Theory Workshop. [[Paper]]()
2. **Nam Nguyen**, Thinh Nguyen, Bella Bose, "Perception-based Image Denoising via Generative Compression," accepted at The IEEE International Conference on Image Processing (ICIP), 2026. [[Paper]](https://arxiv.org/abs/2602.11553) 
3. **Nam Nguyen**, Thinh Nguyen, Bella Bose, "Cross-Domain Lossy Compression via Rate- and Classification-constrained Optimal Transport," accepted at The Fourteenth International Conference on Learning Representations (ICLR), 2026. (Oral Presentation) [[Paper]](https://openreview.net/forum?id=mUIGdUTtk2&referrer=%5BAuthor%20Console%5D(%2Fgroup%3Fid%3DICLR.cc%2F2026%2FConference%2FAuthors%23your-submissions))  
4. **Nam Nguyen**, Thinh Nguyen, Bella Bose, "Rate-Distortion-Classification Representation Theory for Bernoulli Sources," IEEE International Symposium on Information Theory (ISIT), 2026 (Accepted). [[Paper]](https://arxiv.org/abs/2601.11919) 
5. **Nam Nguyen**, Thuan Nguyen, Thinh Nguyen, Bella Bose, "Universal Rate-Distortion-Classification Representations for Lossy Compression," submitted to IEEE Journal on Selected Areas in Information Theory, 2025. [[Paper]](https://arxiv.org/abs/2504.09932) 

---
## Technical Reports
1. **Nam Nguyen**, "High Perceptual Quality Image Denoising via Neural Compression," Department of Electrical and Computer Engineering and Computer Science, Oregon State University, AI637 Computer Vision Course Project Report, December 2023. [[Report]](https://namnguyenresearch.github.io/files/AI637_Final_Project_Report.pdf)
2. **Nam Nguyen**, "Universal Representations for Classification-enhanced Lossy Compression," Department of Electrical and Computer Engineering and Computer Science, Oregon State University, ECE519 Seminar Report, March 2024.
3. **Nam Nguyen**, "Reading Report of Jeffreys Prior Regularization for Logistic Regression," Department of Electrical and Computer Engineering and Computer Science, Oregon State University, February 2024.
4. **Nam Nguyen**, "Reading Report of A Khatri-Rao Subspace Approach to Blind Identification of Mixtures of Quasi-Stationary Sources," Department of Electrical and Computer Engineering and Computer Science, Oregon State University, January 2024.

---
## Thesis

+ [M.Sc.] Nam Nguyen, "On Minimizing Symbol Error Probability Using Beamforming in MIMO Gaussian Wiretap
Channels", Department of Electrical Engineering and Computer Science, Oregon State University, United States, Dec. 2024. 
+ [B.Eng] Nam Nguyen, "Performance Enhancement of Satellite-based Free-Space Quantum Key Distribution Systems using Key Retransmission and Relaying Techniques", Department of Telecommunications, Posts and Telecommunications Institute of Technology, Vietnam, May 2021.

