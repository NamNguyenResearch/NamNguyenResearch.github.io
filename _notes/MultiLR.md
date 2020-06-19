---
title: "Multinomial Logistic Regression: Convexity and Smoothness"
collection: notes
permalink: /notes/2016/MLR
date: 2016-10-29
excerpt: Multinomial logistic regression is a generalization of binary logistic regression to multiclass problems. This note will explain the nice geometry of the likelihood function in estimating the model parameters, the key to understanding how multinomial logistic regression works. 
enable: true
---


---
# 1. Softargmax function

The **softargmax** (a.k.a. *softmax*, *normalized exponential*) function $\DeclareMathOperator*{\argmax}{argmax} \newcommand{\bm}[1]{\boldsymbol#1} \newcommand{\abs}[1]{\left\lvert#1\right\rvert} \bm \sigma: \mathbb{R}^C \rightarrow \mathbb{R}^C$ is defined as

$$ \bigl( \bm \sigma(\bm z) \bigr)_i = \frac{\exp(z_i)}{\sum_{j=1}^C \exp(z_j)} \text{ for } i=1,\ldots,C \text{ and } \bm z \in \mathbb{R}^C . $$

Theorem 1.
: The derivative of $\bm \sigma$ is given by $\nabla \bm \sigma = \bm D \bigl(\bm \sigma \bigr) - \bm \sigma \bm \sigma^T$, where $\bm D(\bm \sigma) = \text{diag}(\bm \sigma)$. Furthermore, it holds that 

$$ 0 \preceq \nabla \bm \sigma \preceq \frac{1}{2} \Bigl( \bm I_C - \frac{1}{C} \bm 1_C \bm 1_C^T \Bigr) . \tag{1} \label{bound_sigma} $$

**Proof.**
For any $i,j = 1,\ldots,C$, we have

$$ \frac{\partial \bigl( \bm \sigma(\bm z) \bigr)_i}{\partial z_j} = \frac{\delta_{ij} \exp(z_i) \sum_{k=1}^C \exp(z_k) - \exp(z_i) \exp(z_j)}{\Bigl(\sum_{k=1}^C \exp(z_k)\Bigr)^2} = \delta_{ij} \bigl( \bm \sigma(\bm z) \bigr)_i - \bigl( \bm \sigma(\bm z) \bigr)_i \bigl( \bm \sigma(\bm z) \bigr)_j . $$

In matrix form, we can rewrite as $\nabla \bm \sigma = \frac{\partial \bm \sigma}{\partial \bm z} = \bm D \bigl(\bm \sigma \bigr) - \bm \sigma \bm \sigma^T$. Since the sum of the components of $\bm \sigma$ is $1$, its derivative is diagonally dominant. We can show that a diagonally dominant matrix $\bm M$ (i.e., $M_{ii} \geq \sum_{j \neq i} \abs{M_{ij}}$ for any row $i$) is positive semidefinite (PSD) as follows. Let $\lambda$ be an eigenvalue of $\bm M$ and $\bm x$ be its corresponding eigenvector. Then $\bm M \bm x = \lambda \bm x$. Suppose $x_i = \argmax_{j} \abs{x_j}$, we have $M_{ii}x_i + \sum_{j \neq i} M_{ij} x_j = \lambda x_i$. This implies

$$ \abs{M_{ii}-\lambda} \abs{x_i} = \abs{\sum_{j \neq i} M_{ij} x_j} \leq \Bigl(\sum_{j \neq i} \abs{M_{ij}}\Bigr) \abs{x_i} \leq M_{ii} . $$

The last inequality shows that $\lambda \geq 0$ or $\bm M$ is PSD. The upperbound in (\ref{bound_sigma}) can be found in *[1]*.


---
# 2. Multinomial Logistic Regression (MLR)
For simplicity, let us consider the problem with just one observation including the input $\bm x \in \mathbb{R}^d$ and the one-hot output vector $\bm y \in \\{ 0,1 \\}^C$. The MLR model with parameter $\bm w = [\bm w_1^T, \ldots, \bm w_C^T]^T \in \mathbb{R}^{Cd}$ is given by 

$$ p_i = Pr(y_i=1 \mid \bm x ; \bm w) = \frac{\exp(\bm w_i^T \bm x)}{\sum_{j=1}^C \exp(\bm w_j^T \bm x)} \text{ for } i=1,\ldots,C . $$

Here again for the reason of simplicity, we ignore the bias term. Notice that the stochastic vector $\bm p = [p_1,\ldots,p_C]$ is indeed a function of $\bm w$ and $\bm p(\bm w) = \bm \sigma(\bm W \bm x)$, where $\bm W = [\bm w_1,\ldots,\bm w_C]^T .$

The maximum likelihood estimation aims to optimize the following objective function

$$ l(\bm w) = \log \prod_{i=1}^C p_i^{y_i} = \sum_{i=1}^C y_i \bm w_i^T \bm x - \log \Bigl( \sum_{i=1}^C \exp(\bm w_i^T \bm x) \Bigr) . $$

Thus we are interested in the gradient and the Hessian of $l(\bm w)$. The derivation of the two involves some simple but interesting algebra. First, let us begin with the derivative:

$$ \frac{\partial l(\bm w)}{\partial \bm w_i} = y_i \bm x_i - \frac{\exp(\bm w_i^T \bm x)}{\sum_{j=1}^C \exp(\bm w_j^T \bm x)} \bm x_i = (y_i - p_i) \bm x \quad \Rightarrow \quad \nabla l(\bm w) = (\bm y - \bm p) \otimes \bm x . \tag{2} \label{gradient} $$

The Hessian can then be computed using the derivative of the softargmax function as follows:

$$ \frac{\partial^2 l(\bm w)}{\bm w_j \bm w_i^T} = \frac{\partial}{\partial \bm w_j} \big( (y_i - p_i) \bm x \bigr)^T = \frac{\partial p_i(\bm w)}{\partial \bm w_j} \bm x^T = \frac{\partial \bigl( \bm \sigma(\bm z) \bigr)_i}{\partial z_j} \frac{\bm w_j^T \bm x}{\bm w_j} \bm x^T = (p_i - p_i p_j) \bm x \bm x^T . $$

From here, we come up with a lesser-known form of the Hessian

$$ \nabla^2 l(\bm w) = \bigl(\bm D(\bm p) - \bm p \bm p^T \bigr) \otimes \bm x \bm x^T . \tag{3} \label{hessian} $$

It is straightforward to see from (\ref{bound_sigma}) that $l(\bm w)$ with bounded Hessian is a smooth convex function. Finally, when there are multiple observations the fomulas (\ref{gradient}) and (\ref{hessian}) can be extended to the sum over all observations.  


---
## References
```
1. Dankmar Böhning, “Multinomial logistic regression algorithm,” Annals of the Institute of Statistical Mathematics, vol. 44, no. 1, pp. 197–200, 1992.
```

