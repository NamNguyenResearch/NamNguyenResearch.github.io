---
title: "Some Useful Inequalities in Convex Optimization"
collection: notes
permalink: /notes/2018/ConvexOptimization
date: 2018-04-29
excerpt: This note collects a set of inequalities that I found extremely useful in convex analysis. We will consider two simple applications of them in proofs of gradient descent and proximal gradient descent.
enable: true
<!--tags:
  - convex optimization
  - convergence analysis-->
---


---
# 1. Lower and upper bounds

**Assumption.** Let function $$\newcommand{\norm}[1]{\left\lVert#1\right\rVert} f: \mathbb{R}^n \rightarrow \mathbb{R}$$ be a continuous and twice differentiable (if necessary), for any $$x,y \in \mathbb{R}^n, \alpha \in [0,1]$$. 

Theorem 1.
: $$f$$ is convex if and only if one of the following conditions holds:
1. $$f(\alpha x + (1-\alpha)y) \leq \alpha f(x) + (1-\alpha) f(y)$$,
2. $$f(y) \geq f(x) + \langle \nabla f(x), y-x \rangle$$,
3. $$\langle \nabla f(x) - \nabla f(y), x-y \rangle \geq 0$$,
4. $$\nabla^2 f(x) \succeq \boldsymbol{0} $$.

Theorem 2.
: $$f$$ is smooth with Lipschitz continous gradient $$L>0$$ if and only if one of the following conditions holds:
1. $$\norm{\nabla f(x)-\nabla f(y)} \leq L \norm{x-y}$$,
2. $$\frac{\alpha(1-\alpha)}{2L} \norm{\nabla f(x)-\nabla f(y)}^2 \leq \alpha f(x) + (1-\alpha) f(y)-f(\alpha x + (1-\alpha)y) \leq \frac{\alpha(1-\alpha)L}{2} \norm{x-y}^2$$,
3. $$\frac{1}{2L} \norm{\nabla f(x)-\nabla f(y)}^2 \leq f(y)-f(x)-\langle \nabla f(x),y-x \rangle \leq \frac{L}{2} \norm{x-y}^2$$,
4. $$\frac{1}{L} \norm{\nabla f(x)-\nabla f(y)}^2 \leq \langle \nabla f(x)-\nabla f(y),x-y \rangle \leq L \norm{x-y}^2$$,
5. $$\nabla^2 f(x) \preceq L I_n$$.

Theorem 3.
: $$f$$ is strongly convex with constant $$\mu>0$$ if and only if one of the following conditions holds:
1. $$\norm{\nabla f(x)-\nabla f(y)} \geq \mu \norm{x-y}$$,
2. $$\frac{\alpha(1-\alpha)\mu}{2} \norm{x-y}^2 \leq \alpha f(x) + (1-\alpha) f(y)-f(\alpha x + (1-\alpha)y) \leq \frac{\alpha(1-\alpha)}{2\mu} \norm{\nabla f(x)-\nabla f(y)}^2$$,
3. $$\frac{\mu}{2} \norm{x-y}^2 \leq f(y)-f(x)-\langle \nabla f(x),y-x \rangle \leq \frac{1}{2\mu} \norm{\nabla f(x)-\nabla f(y)}^2$$,
4. $$\mu \norm{x-y}^2 \leq \langle \nabla f(x)-\nabla f(y),x-y \rangle \leq \frac{1}{\mu} \norm{\nabla f(x)-\nabla f(y)}^2$$,
5. $$\nabla^2 f(x) \succeq \mu I_n$$.

Theorem 4.
: A smooth and strongly convex function $$f$$ with constants $$L,\mu>0$$ satisfies:  
$$ \begin{align*}
\langle \nabla f(x)-\nabla f(y),x-y \rangle \geq \frac{\mu L}{\mu+L} \norm{x-y}^2+\frac{1}{\mu+L}\norm{\nabla f(x)-\nabla f(y)}^2. 
\end{align*}$$


# 2. Convergence of gradient descent (GD)

For simplicity, we consider fixed step size $$\eta_k=\frac{1}{L}$$:

$$ x^k=x^{k-1}- \frac{1}{L} \nabla f (x^{k-1}) . \tag{1} \label{gd_update} $$

For convenience, denote $$f(x^k)$$ and $$\nabla f(x^k)$$ by $$f^k$$ and $$\nabla f^k$$, respectively. Then by the smoothness of $f$ at $x^k$, we have

\begin{aligned} f^k &\leq f^{k-1} + \langle \nabla f^{k-1}, x^k-x^{k-1} \rangle  + \frac{L}{2} \norm{x^k-x^{k-1}}^2 \\\\\\
&= f^{k-1} - \langle \nabla f^{k-1}, \frac{1}{L} \nabla f^{k-1} \rangle  + \frac{L}{2} \norm{\frac{1}{L} \nabla f^{k-1}}^2 \\\\\\
&= f^{k-1} - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 . \end{aligned}

Further, from the strong convexity of $f$ at $x^{k-1}$:

\begin{aligned} f^k &\leq f^{\star} - \langle \nabla f^{k-1}, x^{\star}-x^{k-1} \rangle - \frac{\mu}{2} \norm{x^{\star}-x^{k-1}}^2 - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 \\\\\\
&= f^{\star} + \langle \nabla f^{k-1}, x^{k-1}-x^{\star} \rangle - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 - \frac{\mu}{2} \norm{x^{\star}-x^{k-1}}^2 \\\\\\
&= f^{\star} - \frac{L}{2} \bigg( \norm{x^{k-1}-x^{\star}}^2 - \norm{x^{k-1}-x^{\star}-\frac{1}{L}\nabla f^{k-1} }^2 \bigg) - \frac{\mu}{2} \norm{x^{k-1}-x^{\star}}^2 . \end{aligned}

Thus, we can bound the distance on the function side by:

$$f^k-f^{\star} \leq \frac{L}{2} \bigg( \big( 1-\frac{\mu}{L} \big) \norm{x^{k-1}-x^{\star}}^2 - \norm{x^{k}-x^{\star}}^2 \bigg) \tag{2} \label{obj_side}$$

Since $f$ is convex, there are two possibilities:
- If $$\mu=0$$, from (\ref{obj_side}) we have $$f^k-f^{\star} \leq \frac{L}{2} \bigg( \norm{x^{k-1}-x^{\star}}^2 - \norm{x^{k}-x^{\star}}^2 \bigg)$$. Summing over all $$i=1,\ldots,k$$ yields

$$ f^k - f^{\star} \leq \frac{L}{2k} \norm{x^0-x^{\star}}^2. \qquad \qquad \text{ (Sublinear rate)}  $$

- If $$\mu>0$$, from (\ref{obj_side}) we have $$\norm{x^k-x^{\star}}^2 \leq \big( 1-\frac{\mu}{L} \big) \norm{x^{k-1}-x^{\star}}^2$$. Thus a simple recursion yields

$$ \norm{x^k-x^{\star}}^2 \leq \big( 1-\frac{\mu}{L} \big)^k \norm{x^0-x^{\star}}^2 . \qquad \text{ (Linear rate) }  $$

Remark 1.
: Notice the difference among bounds on function value and bounds on domain side. The convergence rate hence depends on which sequence is considered.
- From (\ref{gd_update}), we can derive a better bound:  
\begin{aligned} f^{k-1}-f^k &\geq \frac{1}{2L} \norm{\nabla f^{k-1}}^2 \geq \frac{\mu}{L} (f^{k-1}-f^{\star}) \\\\\\ \Rightarrow f^k-f^{\star} &\leq (1-\frac{\mu}{L})^k (f^0-f^{\star}) . \end{aligned}
- From Theorem 4, choosing $$\eta=\frac{2}{L+\mu}$$ results in the optimal rate:  
\begin{aligned} &\norm{x^k-x^{\star}} \leq (1-\frac{2\mu}{L+\mu})^k \norm{x^0-x^{\star}}, \\ &f^k-f^{\star} \leq \frac{L}{2} (1-\frac{2\mu}{L+\mu})^{2k} \norm{x^0-x^{\star}}^2 . \end{aligned}
- The proof for backtracking line search relies on the fact that the step size $$\eta_k \geq \min\{\beta, \frac{\eta_0}{L} \}$$.


# 3. Convergence of proximal gradient descent (PGD)
Consider $$g(x)=f(x)+h(x)$$ where the regularization term $$h(x)$$ is convex. The PGD update is  

$$ x^k= \text{prox}_{h/L} \Big(x^{k-1}-\frac{1}{L} \nabla f(x^{k-1})\Big) = x^{k-1} - \frac{1}{L} G(x^{k-1}) , $$ 

where $$ G(x)=L \cdot \big( x^{k-1} - \text{prox}_{h/L} (x^{k-1}-\frac{1}{L}x^{k-1}) \big) $$. Similar to GD, we have

\begin{aligned}
g^k &= f^k+h^k \\\\\\
&\leq \bigg( f^{k-1} - \langle \nabla f^{k-1}, \frac{1}{L} G^{k-1} \rangle + \frac{1}{2L} \norm{G^{k-1}}^2 \bigg) + \bigg( h^{\star} + \langle \partial h^k, x^k-x^{\star} \rangle \bigg) \\\\\\
&\leq \bigg( f^{\star} + \langle \nabla f^{k-1}, x^{k-1}-x^{\star} \rangle - \frac{\mu}{2} \norm{x^{k-1}-x^{\star}}^2 \bigg) - \langle \nabla f^{k-1}, \frac{1}{L} G^{k-1} \rangle \\\\\\
&\qquad + \frac{1}{2L} \norm{G^{k-1}}^2 + h^{\star} + \langle \partial h^k, x^k-x^{\star} \rangle \\\\\\
&= g^{\star} + \langle \nabla f^{k-1} + \partial h^k, x^k-x^{\star} \rangle + \frac{1}{2L} \norm{G^{k-1}}^2 - \frac{\mu}{2} \norm{x^{k-1}-x^{\star}}^2 .
\end{aligned}

Since $$G^{k-1}-\nabla f^{k-1} \in \partial h^{k}$$, we obtain

\begin{aligned}
g^k &\leq g^{\star} + \langle G^{k-1}, x^k-x^{\star} \rangle + \frac{1}{2L} \norm{G^{k-1}}^2 - \frac{\mu}{2} \norm{x^{k-1}-x^{\star}}^2 \\\\\\
&= g^{\star} + \langle G^{k-1}, x^{k-1}-x^{\star} \rangle - \frac{1}{2L} \norm{G^{k-1}}^2 - \frac{\mu}{2} \norm{x^{k-1}-x^{\star}}^2 \\\\\\
&= \frac{L}{2} \bigg( \big( 1-\frac{\mu}{L} \big) \norm{x^{k-1}-x^{\star}}^2 - \norm{x^{k}-x^{\star}}^2 \bigg) .
\end{aligned}


## References
> 1. Y. Nesterov, Introductory lectures on convex optimization: a basic course, Kluwer Academic Publishers, 2004.

