---
title: "Notes on Dirichlet Distribution"
collection: notes
permalink: /note/2019/DirichletDist
date: 2018-01-12
enable: true
excerpt: Derivation of EM algorithm for estimating the parameters of Dirichlet distribution. 
---


Let $$\newcommand{\bm}[1]{\boldsymbol#1} \bm \alpha = (\alpha_1, \ldots, \alpha_K)$$ be a vector of positive reals. For each $$k=1,\ldots,K$$, denote $$X_k$$ the random variable that is gamma-distributed with shape $$\alpha_k$$ and scale $$1$$, i.e. 

$$ \begin{align*} X_k \sim \text{Gamma}(\alpha_k,1). \end{align*} $$

Then the random vector $$\bm{P} =(P_1,\ldots,P_K)$$, defined by $$P_k = \frac{X_k}{\sum_{j=1}^K X_j}$$, follows a Dirichlet distribution of order $$K$$ with parameter $$\bm{\alpha}$$. Suppose $$\bm{x}=(x_1,\ldots,x_K)$$ and $$\bm{p}=(p_1,\ldots,p_K)$$, $$\sum_{k=1}^K p_k=1$$, are the corresponding samples of $$\bm{X}$$ and $$\bm{P}$$. The probability distributions are given by

$$ \begin{align*}
f(x_k  \mid \alpha_k) &= \frac{x_k^{\alpha_k-1} e^{-x_k}}{\Gamma(\alpha_k)} \\
f(\bm p \mid \bm \alpha) &= \frac{\Gamma(\sum_{k=1}^K \alpha_k)}{\prod_{k=1}^K \Gamma(\alpha_k)} \prod_{k=1}^K p_k^{\alpha_k-1}
\end{align*} $$

where the gamma function is define as $$ \Gamma(z)=\int_0^{\infty} x^{z-1} e^{-x}dx $$.


# 1. Single sample estimation
Consider the problem of estimating the parameter $$\bm \alpha$$ of a Dirichlet distribution given an observation $$\bm p$$. The incomplete and complete log likelihood are as follows

$$ \begin{align*}
l(\bm \alpha; \bm p) &= \log f(\bm p | \bm \alpha) = \sum_{k=1}^K \alpha_k \log p_k - \sum_{k=1}^K \log \Gamma(\alpha_k) + \log \Gamma(\sum_{k=1}^K \alpha_k) + const \\
l(\bm \alpha; \bm p, \bm x) &= \log f(\bm p, \bm x | \bm \alpha) = \log f(\bm p | \bm x) + \log f(\bm x | \bm \alpha) \\
&= \sum_{k=1}^K \log f(p_k | \bm x) + \sum_{k=1}^K \log f(x_k|\alpha_k) \\
&= \sum_{k=1}^K \alpha_k \log x_k - \sum_{k=1}^K \log \Gamma(\alpha_k) + const
\end{align*} $$

The surrogate function of EM algorithm is given by
$$ \begin{align*}
Q(\bm \alpha | \bm \alpha') &= \mathbb{E}_{\bm X | \bm P,\bm \alpha'} [\log l(\bm \alpha; \bm p, \bm x)] =  \sum_{k=1}^K \alpha_k \mathbb{E}_{\bm X | \bm P,\bm \alpha'} [\log x_k] - \sum_{k=1}^K \log \Gamma(\alpha_k) + const \\
&= \sum_{k=1}^K \alpha_k \mathbb{E}_{X_k | \bm P,\bm \alpha'} [\log x_k] - \sum_{k=1}^K \log \Gamma(\alpha_k) + const \\
&= \sum_{k=1}^K \alpha_k \bigg( \psi(\sum_{k=1}^K \alpha'_k) + \log p_k \bigg) - \sum_{k=1}^K \log \Gamma(\alpha_k) + const \qquad \text{( see \eqref{posterior} )}
\end{align*} $$


Proposition 1.
: $$ \begin{align} \label{posterior}
X_k \mid \bm P,\bm \alpha' \sim \text{Gamma}\Bigl(\sum_{k=1}^K \alpha_k, p_k \Bigr) 
\end{align} $$.

Proof.
: $$ \begin{align*}
f(x_1, \bm p | \bm \alpha) &= \int_{x_2} \ldots \int_{x_K} f(x_1,\ldots,x_K,p_1,\ldots,p_K | \alpha_1,\ldots,\alpha_K) dx_2 \ldots dx_K \\
&= \int_{x_2} \ldots \int_{x_K} \prod_{k=1}^K \bigg( f(x_k | \alpha_k) f(p_k | \bm x) \bigg) dx_2 \ldots dx_K \\
&= \int_{x_2} \ldots \int_{x_K} \prod_{k=1}^K f(x_k | \alpha_k) \prod_{k=1}^K \delta \Bigg( p_k-\frac{x_k}{\sum_{k=1}^K x_k} \Bigg) dx_2 \ldots dx_K \\
&= f(x_1|\alpha_1) \int_s \delta(p_1-\frac{x_1}{s}) \delta(s-\sum_{k=1}^K x_k) \int_{x_K} f(x_K|\alpha_K) \delta(p_K-\frac{x_K}{s}) \\
&\qquad \ldots \int_{x_2} f(x_2|\alpha_2) \delta(p_2-\frac{x_2}{s}) dx_2 \ldots dx_K ds \\
&= f(x_1|\alpha_1) \int_s \delta(p_1-\frac{x_1}{s}) \delta(s-x_1-\sum_{k=2}^K x_k) \int_{x_K} f(x_K|\alpha_K) \delta(p_K-\frac{x_K}{s}) \\
&\qquad \ldots \int_{x_2} f(x_2|\alpha_2) s \delta(x_2 - sp_2) dx_2 \ldots dx_K ds \qquad \text{( since } \delta(\alpha t) = \frac{1}{\alpha} \delta(t) \text{ )} \\
&= f(x_1|\alpha_1) \int_s s f(sp_2 | \alpha_2)  \delta(p_1-\frac{x_1}{s}) \delta(s-x_1-sp_2 - \sum_{k=3}^K x_k) \int_{x_K} f(x_K|\alpha_K) \delta(p_K-\frac{x_K}{s}) \\
&\qquad \ldots \int_{x_3} f(x_3|\alpha_3) s \delta(x_3 - sp_3) dx_3 \ldots dx_K ds \qquad \text{( since } \int_{t} f(t)\delta(t-T)dt = f(T) \text{ )} \\
&\qquad \vdots \\
&= f(x_1|\alpha_1) \int_s s^{K-1} f(sp_2 | \alpha_2) \ldots f(sp_K | \alpha_K)  \delta(p_1-\frac{x_1}{s}) \delta(s-x_1-sp_2-\ldots-sp_K) ds \\
&= \frac{x_1^{\alpha_1-1}e^{-x_1}}{\Gamma(\alpha_1)} \int_s s^{K-1} \prod_{k=2}^K \frac{(sp_k)^{\alpha_k-1}e^{-sp_k}}{\Gamma(\alpha_k)} \delta(p_1-\frac{x_1}{s}) \delta(x_1-sp_1) ds \qquad \text{( since } \sum_{k=1}^K p_k=1 \text{ )} \\
&= \frac{x_1^{\alpha_1-1} e^{-x_1} \prod_{k=2}^K p_k^{\alpha_k-1}}{\prod_{k=1}^K \Gamma(\alpha_k)} \int_s s^{\sum_{k=2}^K \alpha_k} e^{-s(1-p_1)} \delta(p_1-\frac{x_1}{s}) \frac{\delta(s-\frac{x_1}{p_1})}{p_1}ds \\
&= \frac{\Gamma(\sum_{k=1}^K \alpha_k)}{\prod_{k=1}^K \Gamma(\alpha)} \prod_{k=1}^K p_k^{\alpha_k-1} e^{-x_1} x_1^{\alpha_1-1} \bigg( \frac{x_1}{p_1} \bigg)^{\sum_{k=2}^K \alpha_k} e^{-\frac{x_1}{p_1} + x_1} \\
&= f(\bm p | \bm \alpha) \frac{x_1^{\sum_{k=1}^K \alpha_k-1} e^{-\frac{x_1}{p_1}}}{\Gamma(\sum_{k=1}^K \alpha_k) p_1^{\sum_{k=1}^K \alpha_k}} 
\end{align*} $$

Therefore, the probability density function is computed by

$$ \begin{align*}
f(x_1 | \bm p, \bm \alpha) &= \frac{f(x_1, \bm p | \bm \alpha)}{f(\bm p | \bm \alpha)} = \frac{x_1^{\sum_{k=1}^K \alpha_k-1} e^{-\frac{x_1}{p_1}}}{\Gamma(\sum_{k=1}^K \alpha_k) p_1^{\sum_{k=1}^K \alpha_k}}.
\end{align*} $$


# 2. Multiple samples estimation
Similarly, suppose there are $$n$$ observations $$\{ \bm p_1, \ldots, \bm p_n \}$$. We have

$$ \begin{align*}
l(\bm \alpha;\bm p) &= n\Bigg( \sum_{k=1}^K \bigg( \alpha_k t_k - \log \Gamma(\alpha_k) \bigg) + \log \Gamma(\sum_{k=1}^K \alpha_k) \Bigg) + const \\
Q(\bm \alpha | \bm \alpha') &= n \sum_{k=1}^K \Bigg( \alpha_k \bigg( \psi(\sum_{k=1}^K \alpha'_k) + t_k \bigg) - \log \Gamma(\alpha_k) \Bigg) + const \\
&= n\Bigg( \sum_{k=1}^K \bigg( \alpha_k t_k - \log \Gamma(\alpha_k) \bigg) + \bigg( \sum_{k=1}^K \alpha_k \bigg) \psi(\sum_{k=1}^K \alpha'_k) \Bigg) + const \\
\end{align*} $$

where $$t_k = \frac{1}{n}\sum_{i=1}^n \log p_{ik}$$ is the sufficient statistics.

Another way to look at the $$Q$$ function is to use a lower bound on $$\Gamma(\sum_{k=1}^K \alpha_k)$$:

$$ \begin{align*}
\Gamma(x) \geq \Gamma(y) e^{(x-y)\psi(y)}.
\end{align*} $$

In EM algorithm, we maximize $$Q$$ by setting its gradient to zero.

$$ \begin{align*}
\frac{\partial Q}{\partial \alpha_k} = n \bigg( t_k - \psi(\alpha_k) + \psi(\sum_{k=1}^K \alpha'_k) \bigg) = 0 \Rightarrow \alpha_k = \psi^{-1} \bigg( \psi(\sum_{k=1}^K \alpha'_k) + t_k \bigg).
\end{align*} $$

On the other hand, using gradient ascent, we have

$$ \begin{align*}
\frac{\partial l}{\partial \alpha_k} = n \bigg( t_k - \psi(\alpha_k) + \psi(\sum_{k=1}^K \alpha_k) \bigg)
\end{align*} $$






