---
title: "Multinomial Logistic Regression: Convexity and Smoothness"
collection: notes
permalink: /notes/2016/MLR
date: 2016-10-29
excerpt: Multinomial logistic regression is a generalization of binary logistic regression to multiclass problems. This note will explain the nice geometry of the likelihood function in estimating the model parameters by looking at the Hessian of the MLR objective function. 
enable: true
---


---
# 1. Softargmax function

The **softargmax** (a.k.a. *softmax*, *normalized exponential*) function $\DeclareMathOperator*{\argmax}{argmax} \newcommand{\bm}[1]{\boldsymbol#1} \newcommand{\abs}[1]{\left\lvert#1\right\rvert} \bm \sigma: \mathbb{R}^C \rightarrow \mathbb{R}^C$ is defined as

$$ \bigl( \bm \sigma(\bm z) \bigr)_i = \frac{e^{z_i}}{\sum_{j=1}^C e^{z_j}} \text{ for } i=1,\ldots,C \text{ and } \bm z \in \mathbb{R}^C . $$

Notice that $\bm \sigma = \bm \sigma(\bm z)$ is a stochastic vector since the sum of its elements is $1$. For simplicity, we obmit the argument $\bm z$ in $\bm \sigma$ when there is no ambiguity.

Lemma 1.
: The gradient of $\bm \sigma$ is given by $\nabla \bm \sigma = \bm D \bigl(\bm \sigma \bigr) - \bm \sigma \bm \sigma^T$, where $\bm D(\bm \sigma) = \text{diag}(\bm \sigma)$. Furthermore, it holds that 

$$ 0 \preceq \nabla \bm \sigma \preceq \frac{1}{2} \Bigl( \bm I_C - \frac{1}{C} \bm 1_C \bm 1_C^T \Bigr) . \tag{1} \label{bound_sigma} $$

**Proof.**

For any $i,j = 1,\ldots,C$, we have

$$ \frac{\partial \bigl( \bm \sigma(\bm z) \bigr)_i}{\partial z_j} = \frac{\delta_{ij} e^{z_i} \sum_{k=1}^C e^{z_k} - e^{z_i} e^{z_j}}{\Bigl(\sum_{k=1}^C e^{z_k}\Bigr)^2} = \delta_{ij} \bigl( \bm \sigma(\bm z) \bigr)_i - \bigl( \bm \sigma(\bm z) \bigr)_i \bigl( \bm \sigma(\bm z) \bigr)_j . $$

In matrix form, we can represent the gradient as 

$$ \nabla \bm \sigma = \Bigl[ \frac{\partial \sigma_i}{\partial z_j} \Bigr]_{ij} = \bm D \bigl(\bm \sigma \bigr) - \bm \sigma \bm \sigma^T .$$

The lower bound can be shown by the observation that $\bm M = \nabla \bm \sigma$ is [diagonally dominant](https://en.wikipedia.org/wiki/Diagonally_dominant_matrix), i.e., $M_{ii} \geq \sum_{j \neq i} \abs{M_{ij}}$ for any row $i$. Let $\lambda$ be any eigenvalue of $\bm M$ and $\bm x$ be its corresponding eigenvector. Then $\bm M \bm x = \lambda \bm x$. Suppose $x_i = \argmax_{1\leq j \leq C} \abs{x_j}$, we have $M_{ii}x_i + \sum_{j \neq i} M_{ij} x_j = \lambda x_i$. This implies

$$ \abs{M_{ii}-\lambda} \abs{x_i} = \abs{\sum_{j \neq i} M_{ij} x_j} \leq \Bigl(\sum_{j \neq i} \abs{M_{ij}}\Bigr) \abs{x_i} \leq M_{ii} . $$

The last inequality shows that $\lambda \geq 0$, or $\bm M$ is *positive semidefinite* (PSD). The upperbound in (\ref{bound_sigma}) can be found in *[1]*. $\qquad \blacksquare$


# 2. Multinomial logistic regression (MLR)
To begin with, let us consider the problem with just one observation including the input $\bm x \in \mathbb{R}^d$ and the one-hot output vector $\bm y \in \\{ 0,1 \\}^C$. The MLR model with parameter $\bm w = [\bm w_1^T, \ldots, \bm w_C^T]^T \in \mathbb{R}^{Cd}$ is given by 

$$ p_i = Pr(y_i=1 \mid \bm x ; \bm w) = \frac{e^{\bm w_i^T \bm x}}{\sum_{j=1}^C e^{\bm w_j^T \bm x}} \quad \text{ for } i=1,\ldots,C . $$

Here again for the reason of simplicity, we ignore the bias term. Notice that the stochastic vector $\bm p = [p_1,\ldots,p_C]$ is indeed a function of $\bm w$ and $\bm p(\bm w) = \bm \sigma(\bm W \bm x)$, where $\bm W = [\bm w_1,\ldots,\bm w_C]^T .$

The maximum likelihood estimation aims to optimize the following objective function

$$ l(\bm w) = \log \prod_{i=1}^C p_i^{y_i} = \sum_{i=1}^C y_i \bm w_i^T \bm x - \log \Bigl( \sum_{i=1}^C e^{\bm w_i^T \bm x} \Bigr) . $$

For convenience, let us consider the minimization of the negative log likelihood $L(\bm w) = -l(\bm w)$. The derivation of the the gradient and the Hessian of $L(\bm w)$ involves some simple but interesting algebra. First, we begin with the derivative:

$$ \frac{\partial L(\bm w)}{\partial \bm w_i} = -y_i \bm x_i + \frac{e^{\bm w_i^T \bm x}}{\sum_{j=1}^C e^{\bm w_j^T \bm x}} \bm x_i = (p_i - y_i) \bm x \quad \text{ for } i=1,\ldots,C . $$

In vector form, the gradient can be represented thanks to the notion of [Kronecker product](https://en.wikipedia.org/wiki/Kronecker_product):

$$ \nabla L(\bm w) = (\bm p - \bm y) \otimes \bm x . \tag{2} \label{gradient} $$

Now we compute the Hessian following a similar calculation of the gradient of the softargmax function in Section 1:

$$ \frac{\partial^2 L(\bm w)}{\bm w_j \bm w_i^T} = \frac{\partial}{\partial \bm w_j} \big( (p_i - y_i) \bm x \bigr)^T = \frac{\partial p_i(\bm w)}{\partial \bm w_j} \bm x^T = \frac{\partial \bigl( \bm \sigma(\bm z) \bigr)_i}{\partial z_j} \frac{\bm w_j^T \bm x}{\bm w_j} \bm x^T = (I_{i=j} p_i - p_i p_j) \bm x \bm x^T . $$

From here, we come up with a lesser-known form of the Hessian

$$ \nabla^2 L(\bm w) = \bigl(\bm D(\bm p) - \bm p \bm p^T \bigr) \otimes \bm x \bm x^T . \tag{3} \label{hessian} $$

Finally, when there are multiple observations the fomulas (\ref{gradient}) and (\ref{hessian}) can be extended to the average sum over all observations:

\begin{align}
	\nabla L(\bm w) &= \frac{1}{N} \sum_{n=1}^N (\bm y_n - \bm p_n) \otimes \bm x_n , \\\\\\
	\nabla^2 L(\bm w) &=  \frac{1}{N} \sum_{n=1}^N \bigl(\bm D(\bm p_n) - \bm p_n \bm p_n^T \bigr) \otimes \bm x_n \bm x_n^T .
\end{align}

The following theorem asserts that $L(\bm w)$ is a smooth convex function and hence, explains why MLR enjoys a nice global geometry on appropriately normalized data. 

Theorem 1.
: Let $\bm X = [\bm x_1,\ldots,\bm x_N]^T \in \mathbb{R}^{N \times d}$. Then
\begin{align} 0 \preceq \nabla^2 L(\bm w) \preceq \frac{1}{2} \Bigl( \bm I_C - \frac{1}{C} \bm 1_C \bm 1_C^T \Bigr) \otimes \frac{1}{N} \bm X^T \bm X . \tag{4} \label{bound_hessian} \end{align}

**Proof.**

We use the following [property of Kronecker product](https://en.wikipedia.org/wiki/Kronecker_product#Abstract_properties): if $\bm A$ and $\bm B$ are square matrices of size $n \times n$ and $m \times m$, respectively, then the eigenvalues of $\bm A \otimes \bm B$ are of the form $\alpha_i \beta_j$ for $i=1,\ldots,n$ and $j=1,\ldots,m$, where $\alpha_i$ and $\beta_j$ are eigenvalues of $\bm A$ and $\bm B$. Thus by Lemma 1,

$$ \lambda_{\min} \bigl(\nabla^2 L(\bm w)\bigr) = \frac{1}{N} \sum_{n=1}^N \min \lambda \bigl(\bm D(\bm p_n) - \bm p_n \bm p_n^T \bigr) \lambda (\bm x_n \bm x_n^T) \geq 0 ,$$

and

$$ \lambda_{\max} \bigl(\nabla^2 L(\bm w)\bigr) = \frac{1}{N} \sum_{n=1}^N \max \lambda \bigl(\bm D(\bm p_n) - \bm p_n \bm p_n^T \bigr) \lambda (\bm x_n \bm x_n^T) $$

$$ \leq \max \lambda \biggl(\frac{1}{2} \Bigl( \bm I_C - \frac{1}{C} \bm 1_C \bm 1_C^T \Bigr)\biggl) \lambda \biggl(\frac{1}{N} \sum_{n=1}^N \bm x_n \bm x_n^T \biggr) $$

$$ = \lambda_{\max} \biggl(\frac{1}{2} \Bigl( \bm I_C - \frac{1}{C} \bm 1_C \bm 1_C^T \Bigr) \otimes \frac{1}{N} \sum_{n=1}^N \bm x_n \bm x_n^T \biggr) . $$

The lower and upper bounds on the eigenvalues of $\nabla^2 L(\bm w)$ imply (\ref{bound_hessian}). $\qquad \blacksquare$  

The matrix $\bm R = \frac{1}{N} \bm X^T \bm X$ reminds us of the [autocorrelation matrix](https://en.wikipedia.org/wiki/Autocorrelation). Indeed, if the data is standardized to zero mean and unit variance, $\bm R$ gives an estimate on the matrix of [Pearson product-moment correlation coefficients](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient).  


## Acknowledgement
I would like to thank [Magnus Wiese](magnus.wiese@protonmail.com) and [Neelesh Verma](neverma@cs.stonybrook.edu) for their feedback on this note.

## References
> 1. D. Böhning, “Multinomial logistic regression algorithm,” Annals of the Institute of Statistical Mathematics, vol. 44, no. 1, pp. 197–200, 1992.

