---
title: "Some Useful Inequalities in Convex Optimization"
collection: notes
permalink: /notes/2017/ConvexOptimization
date: 2017-04-29
excerpt: This note collects a set of inequalities for smooth convex functions. As an introduction, we shall prove the convergence of gradient descent method using some of these inequalities. In particular, we show that gradient descent with fixed step size converges to a global minimum at a sublinear rate when the objective is smooth convex, and at a linear rate when strong convexity is added. It is also surprising to me that while the loose bound, $1-\mu/L$, is commonly used in standard convex analysis, the tight bound, $(1-\mu/L)^2$, is a lesser known fact and can hardly be found in notes/lectures on this topic.
enable: true
<!--tags:
  - convex optimization
  - convergence analysis-->
---


---
Author: [Dr. Trung Vu](https://trungvietvu.github.io/)

# 1. Properties of smooth convex functions

Let $\DeclareMathOperator*{\argmin}{argmin} \newcommand{\norm}[1]{\left\lVert#1\right\rVert} \newcommand{\bm}[1]{\boldsymbol#1} f: \mathbb{R}^n \rightarrow \mathbb{R}$ be a continuous and twice differentiable function and $\norm{\cdot}$ denote the Euclidean norm. In the following theorems, we assume $\bm x, \bm y \in \mathbb{R}^n$ and $\alpha \in [0,1]$ are arbitrary.

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

Proofs of the above theorems can be found in [1], Chapter 2. In the following section, we shall look at a simple application of some particular inequalities to the convergence gradient descent.

# 2. Convergence of gradient descent (GD)

We consider a fixed step size gradient descent method to minimize a smooth convex function $f$. At $k$-th iteration, the GD update is given by:

$$ \bm x^k = \bm x^{k-1} - \frac{1}{L} \nabla f (\bm x^{k-1}) . $$

For notational simplicity, denote $f^k=f(\bm x^k)$, $\nabla f^k=\nabla f(\bm x^k)$. Then by the smoothness of $f$ at $\bm x^k$, we obtain a descent guarantee of GD:

\begin{align} f^k &\leq f^{k-1} + \langle \nabla f^{k-1}, \bm x^k- \bm x^{k-1} \rangle  + \frac{L}{2} \norm{\bm x^k- \bm x^{k-1}}^2 \\\\\\
&= f^{k-1} - \langle \nabla f^{k-1}, \frac{1}{L} \nabla f^{k-1} \rangle  + \frac{L}{2} \norm{\frac{1}{L} \nabla f^{k-1}}^2 \\\\\\
&= f^{k-1} - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 . \tag{1} \label{descent} \end{align}

Rearranging terms in (\ref{descent}) yields

$$ \norm{\nabla f^{k-1}}^2 \leq 2L(f^{k-1} - f^k) . $$

Summing over all $k=1,\ldots,K$ (telescoping), we have

$$ \sum_{k=1}^K \norm{\nabla f^{k-1}}^2 \leq 2L(f^0 - f^K) \leq 2L(f^0 - f^\star) . $$

where $f^\star = \min_{\bm x \in \mathbb{R}^n} f(\bm x)$. It can be seen that $\lim_{k \to \infty} \norm{\nabla f^{k}} = 0$. Thus, GD converges to a first-order stationary point of $f$. Notice that the above analysis holds for any smooth functions and does not require convexity. After $K$ iterations, the minimum norm of the gradient is bounded by

$$ \min_{k=1,\ldots,K} \norm{\nabla f^{k-1}} \leq \sqrt{\frac{2L(f^0 - f^\star)}{K}} . $$

In other words, GD takes at most $O(1/\epsilon^2)$ iterations to reach shrink $\norm{\nabla f(\bm x)}$ to $\epsilon$. Now if we use the convexity of $f$, it must be the case that GD converges to a global minimizer of $\bm x^\star$ of $f$, i.e., $f(\bm x^\star) = f^\star$. If we think of the convexity as a special case of the strong convexity with $\mu=0$, then applying Theorem 3-3 to the first term on the RHS of (\ref{descent}) yields

\begin{align} f^k &\leq \biggl( f^{\star} - \langle \nabla f^{k-1}, \bm x^{\star}- \bm x^{k-1} \rangle - \frac{\mu}{2} \norm{\bm x^{\star} - \bm x^{k-1}}^2 \biggr) - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 \\\\\\
&= f^{\star} + \langle \nabla f^{k-1}, \bm x^{k-1}- \bm x^{\star} \rangle - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 - \frac{\mu}{2} \norm{\bm x^{\star}- \bm x^{k-1}}^2 \\\\\\
&= f^{\star} + \frac{L}{2} \bigg( \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^{k-1}- \bm x^{\star}-\frac{1}{L}\nabla f^{k-1} }^2 \bigg) - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 \\\\\\
&= f^{\star} + \frac{L}{2} \bigg( \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^{k}- \bm x^{\star}}^2 \bigg) - \frac{\mu}{2} \norm{\bm x^{k-1}- \bm x^{\star}}^2 . \end{align}

Thus, we can bound the distance on the function side by:

$$ f^k-f^{\star} \leq \frac{L}{2} \bigg( \Big( 1-\frac{\mu}{L} \Big) \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^{k}- \bm x^{\star}}^2 \bigg) . \tag{2} \label{bound_f} $$

1. If $\mu=0$, then (\ref{bound_f}) is equivalent to $f^k-f^{\star} \leq \frac{L}{2} \Bigl( \norm{\bm x^{k-1} - \bm x^{\star}}^2 - \norm{\bm x^{k}- \bm x^{\star}}^2 \Bigr)$. Summing over all $k=1,\ldots,K$ yields
\begin{align} f^K - f^{\star} \leq \frac{1}{K} \sum_{k=1}^K \bigl(f^k - f^{\star}\bigr) \leq \frac{L}{2K} \norm{\bm x^0- \bm x^{\star}}^2 . \end{align}
Thus, GD takes at most $O(1/\epsilon)$ iterations to reach an $\epsilon$-optimal value, i.e., $f(\bm x)-f^\star \leq \epsilon$. This convergence is known as **sublinear**.

2. If $\mu>0$, $\bm x^\star$ is unique. Then (\ref{bound_f}) implies $\big( 1-\frac{\mu}{L} \big) \norm{\bm x^{k-1}- \bm x^{\star}}^2 - \norm{\bm x^k- \bm x^{\star}}^2 \geq 0$. A simple recursion can lead to an exponential bound
\begin{align} \norm{\bm x^k- \bm x^{\star}} \leq \Bigl( 1-\frac{\mu}{L} \Bigr)^{k/2} \norm{\bm x^0- \bm x^{\star}} . \tag{3} \label{domain_side} \end{align}
After $K$ iterations, in order to reach $\norm{\bm x^K- \bm x^{\star}} \leq \epsilon$, it is sufficient to have
\begin{align} \Bigl( 1-\frac{\mu}{L} \Bigr)^{K/2} \norm{\bm x^0- \bm x^{\star}} \leq \epsilon \qquad \Leftrightarrow \qquad K \geq \frac{2\log(\norm{\bm x^0- \bm x^{\star}}/\epsilon)}{\log(1/(1-\mu/L))} . \end{align}
Thus, GD takes at most $O(\log(1/\epsilon))$ to reach an $\epsilon$-optimal solution. This convergence is known as **linear**, which is a lot faster than the sublinear convergence in the former case without strong convexity. Since $\log(1/(1-\mu/L)) \approx \mu/L$ when the condition number $\kappa = L/\mu$ is large, a good estimation of the number of iterations is often obtained by $K \approx 2\kappa \log(\norm{\bm x^0- \bm x^{\star}}/\epsilon)$.

Let us now carefully examine the second case where linear convergence is obtained. If we try to bound the error on the function side instead of the domain side, a similar bound can be obtained by applying inequalities 3 in Theorem 3 to (\ref{descent}):
\begin{align} f^{k-1}-f^k &\geq \frac{1}{2L} \norm{\nabla f^{k-1}}^2 = \frac{1}{2L} \norm{\nabla f^{k-1} - \nabla f^\star}^2 \\\\\\
&\geq \frac{1}{2L} 2\mu \Bigl( f^{k-1} - f^\star - \langle \nabla f^\star , \bm x^{k-1} - \bm x^\star \rangle \Bigr) = \frac{\mu}{L} (f^{k-1}-f^{\star}) , \end{align}
where we use the optimality condition $\nabla f^\star = \bm 0$. Rearranging terms and performing a simple recursion yields
\begin{align} f^k-f^{\star} &\leq \Bigl(1-\frac{\mu}{L}\Bigr)^k (f^0-f^{\star}) . \tag{4} \label{obj_side} \end{align}
Notice the difference between the bounds on the domain side (\ref{domain_side}) and on the function side (\ref{obj_side}). While on the domain side the rate of convergence is $\sqrt{1-\mu/L}$, its counterpart on the function side is $1-\mu/L$. The order of $2$ stems from the fact that we are bounding the objective function by quadratics. Until here, the bound in (\ref{obj_side}) can be found in most notes on convergence of gradient descent.
But <span style="color: red">can we do better?</span> Indeed, we can derive a tighter bound on GD with step size $1/L$ as follows.

**Theorem 5.** GD with fixed step size $1/L$ generates a sequence $\\{ \bm x^k \\}$ satisfies 

\begin{align} \norm{\bm x^k - \bm x^\star} \leq \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr)^{k/2} \norm{\bm x^0 - \bm x^\star}, \qquad f^k - f^\star < \frac{L \norm{\bm x^0 - \bm x^\star}^2}{2(f^0-f^\star)} \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr)^k (f^0 - f^\star) . \end{align}

**Proof.**
We follows the proof of Theorem 2.1.15 in [1]:
\begin{align}
	\norm{\bm x^k - \bm x^\star}^2 &= \norm{\bm x^{k-1} - \bm x^\star - \frac{1}{L} \nabla f^{k-1}}^2 = \norm{\bm x^{k-1} - \bm x^\star}^2 - 2 \langle \bm x^{k-1} - \bm x^\star , \frac{1}{L} \nabla f^{k-1} \rangle + \norm{\frac{1}{L} \nabla f^{k-1}}^2 \\\\\\
	&= \norm{\bm x^{k-1} - \bm x^\star}^2 - \frac{2}{L} \langle \bm x^{k-1} - \bm x^\star , \nabla f^{k-1} - \nabla f^\star \rangle + \frac{1}{L^2} \norm{\nabla f^{k-1}}^2 \\\\\\
	&\leq \norm{\bm x^{k-1} - \bm x^\star}^2 - \frac{2}{L} \biggl( \frac{\mu L}{L+\mu} \norm{\bm x^k - \bm x^\star}^2 + \frac{1}{L+\mu} \norm{\nabla f^{k-1} - \nabla f^\star}^2 \biggr) + \frac{1}{L^2} \norm{\nabla f^{k-1}}^2 \\\\\\
	&= \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr) \norm{\bm x^{k-1} - \bm x^\star}^2 - \frac{1}{L} \Bigl( \frac{2}{L+\mu} - \frac{1}{L} \Bigr) \norm{\nabla f^{k-1}}^2 \\\\\\
	&\leq \Bigl( 1 - \frac{2\mu}{L+\mu} \Bigr) \norm{\bm x^{k-1} - \bm x^\star}^2 ,
\end{align}
where in the first inequality we utilize Theorem 4. The proof for the function side follows from the fact that $f^k - f^\star \leq \frac{L}{2} \norm{\bm x^{k} - \bm x^\star}^2$. Note that the convergence rate on the domain side is $\sqrt{1 - \frac{2\mu}{L+\mu}}$.

**Remark 1.** 
- It is possible to show that the convergence rate on the domain side is $1-\mu/L$. The following is the tightest result I know for GD with fixed step size $1/L$, proved by Polyak [2]:
\begin{align}
&\norm{\bm x^k- \bm x^{\star}} \leq \Bigl(1-\frac{\mu}{L}\Bigr)^{k} \norm{\bm x^0- \bm x^{\star}}, \\ & f^k-f^{\star} \leq \frac{L}{2} \Bigl(1-\frac{\mu}{L}\Bigr)^{2k} \norm{\bm x^0- \bm x^{\star}}^2 . \tag{5} \label{tight} 
\end{align}
- Following the same process as in Theorem 5, a larger step size $\eta=\frac{2}{L+\mu}$ results in the *optimal* rate of convergence for fixed step size GD:  
\begin{align} &\norm{\bm x^k- \bm x^{\star}} \leq \Bigl(1-\frac{2\mu}{L+\mu}\Bigr)^k \norm{\bm x^0- \bm x^{\star}}, \\ &f^k-f^{\star} \leq \frac{L}{2} \Bigl(1-\frac{2\mu}{L+\mu}\Bigr)^{2k} \norm{\bm x^0- \bm x^{\star}}^2 . \end{align}
- The following inequality intuitively describes the improvement in the rate of convergence (on the function side) we have seen in this section: 
\begin{align} 1 - \frac{\mu}{L} > 1 - \frac{2\mu}{L+\mu} > \Bigl(1 - \frac{\mu}{L}\Bigr)^2 > \Bigl(1 - \frac{2\mu}{L+\mu}\Bigr)^2 . \end{align}

# 3. Proof of the tight bound in (\ref{tight}) 

By [Newton-Leibniz formula](https://encyclopediaofmath.org/wiki/Newton-Leibniz_formula), $f$ is twice differentiable implies

$$ \nabla f(\bm x^k) = \nabla f(\bm x^\star) + \int_0^1 \nabla^2 f\bigl(\bm x^\star + \tau (\bm x^k - \bm x^\star)\bigr) (x^k - \bm x^\star) d\tau  = \bm A_k (\bm x^k - \bm x^\star) , $$

for some symmetric $\bm A_k \in \mathbb{R}^{n \times n}$ whose eigenvalues lie between $\mu$ and $L$. Therefore, we have

$$ \bm x^k - \bm x^\star = \bm x^{k-1} - \frac{1}{L} \nabla f (\bm x^{k-1}) - \bm x^\star = \bm x^{k-1} - \bm A_{k-1} (\bm x^{k-1} - \bm x^\star) - x^\star = (\bm I_n - \frac{1}{L} \bm A_{k-1}) (\bm x^{k-1} - \bm x^\star) . $$

Taking the norm and using the definition of [matrix norms induced by vector norms](https://en.wikipedia.org/wiki/Matrix_norm#Matrix_norms_induced_by_vector_norms), we obtain

$$ \norm{\bm x^k - \bm x^\star} \leq \norm{\bm I_n - \frac{1}{L} \bm A_{k-1}}_2 \norm{\bm x^{k-1} - \bm x^\star} \leq \Bigl(1-\frac{\mu}{L}\Bigr) \norm{\bm x^{k-1} - \bm x^\star} , $$

where the last inequality stems from all eigenvalues of $\bm I_n - \frac{1}{L} \bm A_{k-1}$ are of the form $1-\lambda/L$, with $\mu \leq \lambda \leq L$ being some eigenvalue of $\bm A_{k-1}$. 







## References
> 1. Y. Nesterov, Introductory lectures on convex optimization: a basic course, Kluwer Academic Publishers, 2004.
> 2. B. Polyak, Introduction to Optimization. Optimization Software. In Inc., Publications Division, New York (Vol. 1), 1987.

