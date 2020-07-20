---
title: "Some Useful Inequalities in Convex Optimization"
collection: notes
permalink: /notes/2017/ConvexOptimization
date: 2017-04-29
excerpt: This note collects a set of inequalities related to the properties of smooth convex functions that I found extremely useful in convex analysis. We will consider two simple applications of them in proofs of gradient descent and proximal gradient descent.
enable: true
<!--tags:
  - convex optimization
  - convergence analysis-->
---


---
# 1. Properties of smooth convex functions

Let $\DeclareMathOperator*{\argmin}{argmin} \newcommand{\norm}[1]{\left\lVert#1\right\rVert} \newcommand{\bm}[1]{\boldsymbol#1} f: \mathbb{R}^n \rightarrow \mathbb{R}$ be a continuous and twice differentiable function and $\norm{\cdot}$ denote the Euclidean norm. For any points $\bm x, \bm y \in \mathbb{R}^n$ and a constant $\alpha \in [0,1]$, we have: 

Theorem 1.
: $f$ is convex if and only if one of the following conditions holds:
1. $f(\alpha \bm x + (1-\alpha) \bm y) \leq \alpha f(\bm x) + (1-\alpha) f(\bm y)$,
2. <span style="color: red;">$f(\bm y) \geq f(\bm x) + \langle \nabla f(\bm x), \bm y - \bm x \rangle$</span>,
3. $\langle \nabla f(\bm x) - \nabla f(\bm y), \bm x - \bm y  \rangle \geq 0$,
4. $\bm \nabla^2 f(\bm x) \succeq \boldsymbol{0}$.

Theorem 2.
: $f$ has Lipschitz continous gradient with constant $L>0$ if and only if one of the following conditions holds:
1. $\norm{\nabla f(\bm x)-\nabla f(\bm y)} \leq L \norm{\bm x - \bm y }$,
2. $\frac{\alpha(1-\alpha)}{2L} \norm{\nabla f(\bm x)-\nabla f(\bm y)}^2 \leq \alpha f(\bm x) + (1-\alpha) f(\bm y)-f(\alpha \bm x + (1-\alpha) \bm y) \leq \frac{\alpha(1-\alpha)L}{2} \norm{\bm x - \bm y }^2$,
3. $\frac{1}{2L} \norm{\nabla f(\bm x)-\nabla f(\bm y)}^2 \leq$<span style="color: red;">$f(\bm y)-f(\bm x)-\langle \nabla f(\bm x), \bm y - \bm x \rangle \leq \frac{L}{2} \norm{\bm x - \bm y }^2$</span>,
4. $\frac{1}{L} \norm{\nabla f(\bm x)-\nabla f(\bm y)}^2 \leq \langle \nabla f(\bm x)-\nabla f(\bm y),\bm x - \bm y  \rangle \leq L \norm{\bm x - \bm y }^2$,
5. $\bm \nabla^2 f(\bm x) \preceq L \bm I_n$.

Theorem 3.
: $f$ is strongly convex with constant $\mu>0$ if and only if one of the following conditions holds:
1. $\norm{\nabla f(\bm x)-\nabla f(\bm y)} \geq \mu \norm{\bm x - \bm y }$,
2. $\frac{\alpha(1-\alpha)\mu}{2} \norm{\bm x - \bm y }^2 \leq \alpha f(\bm x) + (1-\alpha) f(\bm y)-f(\alpha \bm x + (1-\alpha) \bm y) \leq \frac{\alpha(1-\alpha)}{2\mu} \norm{\nabla f(\bm x)-\nabla f(\bm y)}^2$,
3. <span style="color: red;">$\frac{\mu}{2} \norm{\bm x - \bm y }^2 \leq f(\bm y)-f(\bm x)-\langle \nabla f(\bm x), \bm y - \bm x \rangle$</span>$\leq \frac{1}{2\mu} \norm{\nabla f(\bm x)-\nabla f(\bm y)}^2$,
4. $\mu \norm{\bm x - \bm y }^2 \leq \langle \nabla f(\bm x)-\nabla f(\bm y),\bm x - \bm y  \rangle \leq \frac{1}{\mu} \norm{\nabla f(\bm x)-\nabla f(\bm y)}^2$,
5. $\bm \nabla^2 f(\bm x) \succeq \mu \bm I_n$.

Theorem 4.
: Any $L$-smooth and $\mu$-strongly convex function $f$ (with $L > \mu$) satisfies:  
\begin{align}
\langle \nabla f(\bm x)-\nabla f(\bm y),\bm x - \bm y  \rangle \geq \frac{\mu L}{L+\mu} \norm{\bm x - \bm y }^2+\frac{1}{L+\mu}\norm{\nabla f(\bm x)-\nabla f(\bm y)}^2. 
\end{align}

Proofs of the above theorems can be found in [1], Chapter 2. The most common inequalities we see in literature are the linear and quadratic bounds on the function. Let us consider two simple applications of those inequalities in the following sections.

# 2. Convergence of gradient descent (GD)

In this section, we consider a fixed step size gradient descent method to minimize a smooth convex function $f$. At $k$-th iteration, the GD update is given by:

$$ \bm x^k=\bm x^{k-1}- \frac{1}{L} \nabla f (\bm x^{k-1}) . $$

Let $\bm x^\star = \argmin_{\bm x \in \mathbb{R}^n} f(\bm x)$. For notational simplicity, denote $f^k=f(\bm x^k)$, $\nabla f^k=\nabla f(\bm x^k)$ and $f^\star=f(\bm x^\star)$. Then by the smoothness of $f$ at $\bm x^k$, we obtain a descent guarantee of GD:

\begin{align} f^k &\leq f^{k-1} + \langle \nabla f^{k-1}, \bm x^k- \bm x^{k-1} \rangle  + \frac{L}{2} \norm{\bm x^k- \bm x^{k-1}}^2 \\\\\\
&= f^{k-1} - \langle \nabla f^{k-1}, \frac{1}{L} \nabla f^{k-1} \rangle  + \frac{L}{2} \norm{\frac{1}{L} \nabla f^{k-1}}^2 \\\\\\
&= f^{k-1} - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 . \tag{1} \label{descent} \end{align}

Combining with the strong convexity of $f$ at $\bm x^{k-1}$ yields

\begin{align} f^k &\leq \biggl( f^{\star} - \langle \nabla f^{k-1}, \bm x^{\star}- \bm x^{k-1} \rangle - \frac{\mu}{2} \norm{\bm x^{\star} - \bm x^{k-1}}^2 \biggr) - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 \\\\\\
&= f^{\star} + \langle \nabla f^{k-1}, \bm x^{k-1}- \bm x^{\star} \rangle - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 - \frac{\mu}{2} \norm{\bm x^{\star}- \bm x^{k-1}}^2 \\\\\\
&= f^{\star} + \frac{L}{2} \bigg( \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^{k-1}- \bm x^{\star}-\frac{1}{L}\nabla f^{k-1} }^2 \bigg) - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 \\\\\\
&= f^{\star} + \frac{L}{2} \bigg( \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^{k}- \bm x^{\star}}^2 \bigg) - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 . \end{align}

Thus, we can bound the distance on the function side by:

$$ f^k-f^{\star} \leq \frac{L}{2} \bigg( \Big( 1-\frac{\mu}{L} \Big) \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^{k}- \bm x^{\star}}^2 \bigg) . \tag{2} \label{bound_f} $$

Since $f$ is convex, there are two possibilities:
1. If $\mu=0$, then (\ref{bound_f}) is equivalent to $f^k-f^{\star} \leq \frac{L}{2} \biggl( \norm{\bm x^{k-1} - \bm x^{\star}}^2 - \norm{\bm x^{k}- \bm x^{\star}}^2 \biggr)$. Summing over all $i=1,\ldots,k$ yields the sublinear convergence
\begin{align} f^k - f^{\star} \leq \frac{L}{2k} \norm{\bm x^0- \bm x^{\star}}^2 . \end{align}
2. If $\mu>0$, then (\ref{bound_f}) implies $\big( 1-\frac{\mu}{L} \big) \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^k- \bm x^{\star}}^2 \geq 0$. A simple recursion could lead to the linear convergence
\begin{align} \norm{\bm x^k- \bm x^{\star}} \leq \Bigl( 1-\frac{\mu}{L} \Bigr)^{k/2} \norm{\bm x^0- \bm x^{\star}} . \tag{3} \label{domain_side} \end{align}

Let us focus a little more in the second case where linear convergence is obtained. If we try to bound the error on the function side instead of the domain side, a similar bound can be obtained by applying inequalities 3 in Theorem 3 to (\ref{descent}):
\begin{align} f^{k-1}-f^k &\geq \frac{1}{2L} \norm{\nabla f^{k-1}}^2 = \frac{1}{2L} \norm{\nabla f^{k-1} - \nabla f^\star}^2 \\\\\\
&\geq \frac{1}{2L} 2\mu \Bigl( f^{k-1} - f^\star - \langle \nabla f^\star , \bm x^{k-1} - \bm x^\star \rangle \Bigr) = \frac{\mu}{L} (f^{k-1}-f^{\star}) , \end{align}
where we use the optimality condition $\nabla f^\star = \bm 0$. Rearranging terms and performing a simple recursion yields
\begin{align} f^k-f^{\star} &\leq \Bigl(1-\frac{\mu}{L}\Bigr)^k (f^0-f^{\star}) . \tag{4} \label{obj_side} \end{align}
Notice the difference between the bound on the domain side (\ref{domain_side}) and the function side (\ref{obj_side}). While on the domain side is $\sqrt{1-\mu/L}$, its counterpart on the function side the rate of convergence is $1-\mu/L$. The order of $2$ stems from the fact that we are bounding the objective function by quadratics.
But <span style="color: red">can we do better?</span> Indeed, there exists a tighter bound on GD with step size $1/L$ given by Nesterov in [1]:

**Theorem 5.** GD with fixed step size $1/L$ generates a sequence $\\{ \bm x^k \\}$ satisfies 

\begin{align} \norm{\bm x^k - \bm x^\star} \leq \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr)^{k/2} \norm{\bm x^0 - \bm x^\star}, \qquad f^k - f^\star < \frac{L \norm{\bm x^0 - \bm x^\star}^2}{2(f^0-f^\star)} \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr)^k (f^0 - f^\star) . \end{align}

**Proof.**
We follows the proof of Theorem 2.1.15 in [1]:
\begin{align}
	\norm{\bm x^k - \bm x^\star}^2 &= \norm{\bm x^{k-1} - \bm x^\star - \frac{1}{L} \nabla f^{k-1}}^2 = \norm{\bm x^{k-1} - \bm x^\star}^2 - 2 \langle \bm x^{k-1} - \bm x^\star , \frac{1}{L} \nabla f^{k-1} \rangle + \norm{\frac{1}{L} \nabla f^{k-1}}^2 \\\\\\
	&= \norm{\bm x^{k-1} - \bm x^\star}^2 - \frac{2}{L} \langle \bm x^{k-1} - \bm x^\star , \nabla f^{k-1} - \nabla f^\star \rangle + \frac{1}{L^2} \norm{\nabla f^{k-1}}^2 \\\\\\
	&\leq \norm{\bm x^{k-1} - \bm x^\star}^2 - \frac{2}{L} \biggl( \frac{\mu L}{L+\mu} \norm{\bm x^k - \bm x^\star}^2 + \frac{1}{L+\mu} \norm{\nabla f^{k-1} - \nabla f^\star}^2 \biggr) + \frac{1}{L^2} \norm{\nabla f^{k-1}}^2 \\\\\\
	&= \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr) \norm{\bm x^{k-1} - \bm x^\star}^2 - \frac{1}{L} \Bigl( \frac{2}{L+\mu} - \frac{1}{L} \Bigr) \norm{\nabla f^{k-1}}^2 \\\\\\
	&\leq \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr) \norm{\bm x^{k-1} - \bm x^\star}^2 
\end{align}
where in the first inequality we utilize Theorem 4.

**Remark 1.** 
- Choosing a larger step size $\eta=\frac{2}{L+\mu}$ results in the *optimal* rate of convergence for fixed stepsize GD:  
\begin{align} &\norm{\bm x^k- \bm x^{\star}} \leq \Bigl(1-\frac{2\mu}{L+\mu}\Bigr)^k \norm{\bm x^0- \bm x^{\star}}, \\ &f^k-f^{\star} \leq \frac{L}{2} \Bigl(1-\frac{2\mu}{L+\mu}\Bigr)^{2k} \norm{\bm x^0- \bm x^{\star}}^2 . \end{align}
- The following inequality intuitively describes the improvement in the rate of convergence we have seen in this section: 
\begin{align} 1 - \frac{\mu}{L} > 1 - \frac{2\mu}{L+\mu} > \Bigl(1 - \frac{2\mu}{L+\mu}\Bigr)^2 . \end{align}


# 3. Convergence of proximal gradient descent (PGD)
Following Section 2, suppose our goal instead is to minimize an objective function $g(\bm x)=f(\bm x)+h(\bm x)$ where the regularization term $h: \mathbb{R}^n \to \mathbb{R}$ is convex but potentially non-smooth. Without further algorithmic details, we will go straight to the analysis of PGD algorithm by considering the following update

$$ \bm x^k = \text{prox}_{h/L} \Big(\bm x^{k-1}-\frac{1}{L} \nabla f(\bm x^{k-1})\Big) , $$ 

where the proximal operator is given by

$$ \text{prox}_{h/L}(\bm x) = \argmin_{\bm z \in \mathbb{R}^n} \biggl( \frac{1}{L} h(\bm z) + \frac{1}{2} \norm{\bm z - \bm x}^2 \biggr) . \tag{5} \label{proximal} $$

At first it may look a little trickier than analyzing the plain GD. However, one clever way to get around the proximal operator is to define the generalized gradient as

$$ \bm G(\bm x) = L \Bigl( \bm x - \text{prox}_{h/L} \bigl(\bm x-\frac{1}{L} \nabla f(\bm x) \bigr) \Bigr) . $$

Now the PGD update becomes

$$ \bm x^k = \bm x^{k-1} - \frac{1}{L} \bm G(\bm x^{k-1}) . $$

We can perform similar derivation as follows

\begin{align}
g^k &= f^k+h^k \leq \bigg( f^{k-1} - \langle \nabla f^{k-1}, \frac{1}{L} \bm G^{k-1} \rangle + \frac{1}{2L} \norm{\bm G^{k-1}}^2 \bigg) + \bigg( h^{\star} + \langle \partial h^k, \bm x^k- \bm x^{\star} \rangle \bigg) \\\\\\
&\leq \bigg( f^{\star} + \langle \nabla f^{k-1}, \bm x^{k-1}- \bm x^{\star} \rangle - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 \bigg) - \langle \nabla f^{k-1}, \frac{1}{L} \bm G^{k-1} \rangle \\\\\\
&\qquad + \frac{1}{2L} \norm{\bm G^{k-1}}^2 + h^{\star} + \langle \partial h^k, \bm x^k- \bm x^{\star} \rangle \\\\\\
&= g^{\star} + \langle \nabla f^{k-1} + \partial h^k, \bm x^k- \bm x^{\star} \rangle + \frac{1}{2L} \norm{\bm G^{k-1}}^2 - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 .
\end{align}

Using first-order optimality condition on (\ref{proximal}), we have $\bm G^{k-1}-\nabla f^{k-1} \in \partial h^{k}$. Substituting into the second term yields

\begin{align}
g^k &\leq g^{\star} + \langle \bm G^{k-1}, \bm x^k- \bm x^{\star} \rangle + \frac{1}{2L} \norm{\bm G^{k-1}}^2 - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 \\\\\\
&= g^{\star} + \langle \bm G^{k-1}, \bm x^{k-1}- \bm x^{\star} \rangle - \frac{1}{2L} \norm{\bm G^{k-1}}^2 - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 \\\\\\
\Rightarrow g^k - g^\star &\leq \frac{L}{2} \bigg( \big( 1-\frac{\mu}{L} \big) \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^{k}- \bm x^{\star}}^2 \bigg) .
\end{align}

Here upon we recover the same analysis in Section 2. 


## References
> 1. Y. Nesterov, Introductory lectures on convex optimization: a basic course, Kluwer Academic Publishers, 2004.

