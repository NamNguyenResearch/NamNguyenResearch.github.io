---
title: "Some interesting probability questions"
collection: notes
permalink: /note/2019/ProbabilityFun
date: 2019-05-02
enable: true
excerpt: Some interesting thought on basic probability question. It is embarrasing that I did not give the correct answers at my first try. 
---


---
Last Friday I had an interesting discussion with my advisor on probability theory. He gave me three questions for undergrad-level. They are as follows:

Question 1.
: 1. How many ways can 10 students be divided into 5 groups with 2 students each?
2. Suppose we randomly assign a group of 10 CS students and 10 ECE students into 10 pairs. What is the probability of a diverse assignment? A diverse assignment is defined as the one in which every pair has students from both CS and ECE. 
3. In part 2, what is the probability of a non-diverse assignment? A non-diverse assignment is defined as the one in which every pair only has students from either CS or ECE.

Question 2.
: Assume that every family has 2 children and independent of the other, each children can be either boy or girl with probability $$0.5$$.
1. Given that one child is a boy, what is the probability that the other child is a girl?
2. Given that one child is a boy and his name is Trung, what is the probability that the other child is a girl?

Question 3.
: You are given two envelops with some money enclosed. Suppose that one envelop has twice as much money as the other. Now if you randomly select one envelop and open it, should you change your decision and take the other? The answer is YES, surprisingly. Denote the amount of money you found in the first envelop by $$x$$. Then the other envelop should have either $$2x$$ or $$\frac{x}{2}$$ with equal chance. Thus the expected value in the other envelop is given by  
$$ \begin{align} 
\qquad \qquad \qquad \qquad \qquad \mathbb{E}[y] = .5*(2x) + .5*\frac{x}{2} = 1.25x \nonumber
\end{align} $$  
So if you decide to change your mind, you might expect to get more money on average. What is the problem here? 








