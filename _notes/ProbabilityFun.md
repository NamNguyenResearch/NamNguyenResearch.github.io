---
title: "Some interesting probability questions"
collection: notes
permalink: /note/2019/ProbabilityFun
date: 2019-05-02
enable: false
excerpt: Some interesting thought on basic probability question. It is embarrasing that I did not give the correct answers at my first try. 
---


---
Last Friday I had an interesting discussion with my advisor on probability theory. He gave me three questions for undergrad-level. They are as follows:

Question 1.
: 1. How many ways can 20 students be divided into 10 groups with 2 students each?
2. Suppose we randomly assign a group of 10 CS students and 10 ECE students into 10 pairs. What is the probability of a diverse assignment? A diverse assignment is defined as the one in which every pair has students from both CS and ECE. 
3. In part 2, what is the probability of a non-diverse assignment? A non-diverse assignment is defined as the one in which every pair only has students from either CS or ECE.

<details>
	<summary style="font-style: italic;">Answer</summary>
	<span markdown="span">
		1. The answer is quite straightforward: 
		$$ \frac{\prod_{k=1}^{10} {2k \choose 2}}{10!} = \frac{20!}{10! \cdot 2^{10}}. \nonumber $$  
		2. This question is a little bit tricky since the way we compute the probability depends on the sample space. If we choose the sample space the same as part 1, then there is 10 way to pair the first CS student with an ECE student; the second CS student has 9 choices; and so on. The probability in this case is  
		$$ \qquad \qquad \frac{10!}{\frac{20!}{10! \cdot 2^{10}}} = \frac{(10!)^2 2^{10}}{20!} \approx 0.005542. \nonumber $$  
		<!--On the other hand, we can think of selecting the first pair of students as having equal probability to be diversity or non-diversity. If that pair is diversity, then the numbers of CS and ECE students remain balance. Thus, selecting the second pair of students as having equal probability to be diversity or non-diversity. Continuing this argument until all 10 pairs are formed, we have the probability is $$ \frac{1}{2^{10}}. $$-->
		3. There are $$ \frac{\prod_{k=1}^{5} {2k \choose 2}}{5!} \nonumber $$ ways to group 10 CS (or ECE) students into 5 pairs. Therefore, the probability of a non-diverse assignment is  
		$$ \qquad \qquad \frac{\Bigl(\frac{\prod_{k=1}^{5} {2k \choose 2}}{5!}\Bigr)^2}{\frac{20!}{10! \cdot 2^{10}}} = \frac{(10!)^3}{20! (5!)^2} \approx 0.001364. \nonumber $$  
		Notice that if we choose pairs by random, there is a higher chance of hitting a diversity assignment than a non-diversity one.
	</span> 
</details>


Question 2.
: Assume that every family has 2 children and independent of the other, each children can be either boy or girl with probability $$0.5$$.
1. Given that one child is a boy, what is the probability that the other child is a girl?
2. Given that one child is a boy and his name is Trung, what is the probability that the other child is a girl?

<details>
	<summary style="font-style: italic;">Answer</summary>
	1. The answer can be found by listing all the posibilities: 
		<center><table class="gridtable">
			<tr>
				<th>First child</th>
				<th>Second child</th>
				<th>Probability</th>
			</tr>
			<tr>
				<td>Boy</td>
				<td>Girl</td>
				<td>1/4</td>
			</tr>
			<tr>
				<td>Girl</td>
				<td>Boy</td>
				<td>1/4</td>
			</tr>
			<tr>
				<td>Boy</td>
				<td>Boy</td>
				<td>1/4</td>
			</tr>
		</table></center>
	<span markdown="span">
		Since these cases happen with equal chance, the probability that the other child is a girl is $$ 2/3 $$.  
		2. At a first sight, the fact that knowing the child's name does not seem to change the probability. However, if we go over the same approach in part 1, the answer would be suprising. Let $$ \epsilon $$ be the probability that a child is a boy named "Trung" $$ (0 < \epsilon < 1/2) $$.
	</span> 
		<center><table class="gridtable">
			<tr>
				<th>First child</th>
				<th>Second child</th>
				<th>Probability</th>
			</tr>
			<tr>
				<td>Boy named "Trung"</td>
				<td>Girl</td>
				<td>$$ \epsilon / 2 \nonumber $$</td>
			</tr>
			<tr>
				<td>Girl</td>
				<td>Boy named "Trung"</td>
				<td>$$ \epsilon / 2 \nonumber $$</td>
			</tr>
			<tr>
				<td>Boy named "Trung"</td>
				<td>Boy named "Trung"</td>
				<td>$$ \epsilon^2 \nonumber $$</td>
			</tr>
			<tr>
				<td>Boy not named "Trung"</td>
				<td>Boy named "Trung"</td>
				<td>$$ \epsilon \Bigl( \frac{1}{2}-\epsilon \Bigr) \nonumber $$</td>
			</tr>
			<tr>
				<td>Boy named "Trung"</td>
				<td>Boy not named "Trung"</td>
				<td>$$ \epsilon \Bigl( \frac{1}{2}-\epsilon \Bigr) \nonumber $$</td>
			</tr>
		</table></center>
	<span markdown="span">
		Thus, the probability that the other child is a girl is  
		$$ \qquad \qquad \qquad \frac{\epsilon}{\epsilon + \epsilon^2+\epsilon(1-2\epsilon)} = \frac{1}{2-\epsilon} . $$  
		Note that we have $$ \frac{1}{2} < \frac{1}{2-\epsilon} < \frac{2}{3}. $$  
		This question is somewhat similar to the [Monty Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem).
	</span>
</details>

Question 3.
: You are given two envelops with some money enclosed. Suppose that one envelop has twice as much money as the other. Now if you randomly select one envelop and open it, should you change your decision and take the other? The answer is YES, surprisingly. Denote the amount of money you found in the first envelop by $$x$$. Then the other envelop should have either $$2x$$ or $$\frac{x}{2}$$ with equal chance. Thus the expected value in the other envelop is given by  
$$ \begin{align} 
\qquad \qquad \qquad \qquad \qquad \mathbb{E}[y] = .5*(2x) + .5*\frac{x}{2} = 1.25x \nonumber
\end{align} $$  
So if you decide to change your mind, you might expect to get more money on average. What is the problem here? 

<details>
	<summary style="font-style: italic;">Answer</summary>
	<span markdown="span">
		This question is still a mystery for me. Our discussion is as follows:
		$$ \begin{align*} 
		\qquad \qquad \qquad \qquad \qquad \mathbb{E}[y \mid x] = \int y f(y \mid x) dy = 2x \delta (y-2x) + \frac{x}{2} \delta(y-\frac{x}{2}) = 2x \delta (y-2x) + 
		\end{align*} $$ 
	</span>
</details>




