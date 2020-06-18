---
title: "Notes on Convex Optimization"
collection: notes
permalink: /note/2019/ConvexOptimization
date: 2018-04-29
excerpt: Some useful inequalities in convex analysis and their applications in proofs of gradient descent and proximal gradient descent.
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


# 2. Convergence of Gradient Descent

For simplicity, we consider fixed step size $$\eta_k=\frac{1}{L}$$:

$$ \begin{align*} x^k=x^{k-1}- \frac{1}{L} \nabla f (x^{k-1}). \end{align*}$$

For convenience, denote $$f(x^k)$$ and $$\nabla f(x^k)$$ by $$f^k$$ and $$\nabla f^k$$, respectively. Then from Section 1, we have

$$ \begin{align*} f^k &\leq f^{k-1} + \langle \nabla f^{k-1}, x^k-x^{k-1} \rangle  + \frac{L}{2} \norm{x^k-x^{k-1}}^2 \\
&= f^{k-1} - \langle \nabla f^{k-1}, \frac{1}{L} \nabla f^{k-1} \rangle  + \frac{L}{2} \norm{\frac{1}{L} \nabla f^{k-1}}^2 \\
&= f^{k-1} - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 \end{align*} $$

Further,

$$ \begin{align} 
f^k &\leq f^* - \langle \nabla f^{k-1}, x^*-x^{k-1} \rangle - \frac{\mu}{2} \norm{x^*-x^{k-1}}^2 - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 \nonumber \\
&= f^* + \langle \nabla f^{k-1}, x^{k-1}-x^* \rangle - \frac{1}{2L} \norm{\nabla f^{k-1}}^2 - \frac{\mu}{2} \norm{x^*-x^{k-1}}^2 \nonumber \\
&= f^* - \frac{L}{2} \bigg( \norm{x^{k-1}-x^*}^2 - \norm{x^{k-1}-x^*-\frac{1}{L}\nabla f^{k-1} }^2 \bigg) - \frac{\mu}{2} \norm{x^{k-1}-x^*}^2 \nonumber \\
\Rightarrow f^k-&f^* \leq \frac{L}{2} \bigg( \big( 1-\frac{\mu}{L} \big) \norm{x^{k-1}-x^*}^2 - \norm{x^{k}-x^*}^2 \bigg)
\end{align} $$

- If $$\mu=0$$, from (2) we have $$f^k-f^* \leq \frac{L}{2} \bigg( \norm{x^{k-1}-x^*}^2 - \norm{x^{k}-x^*}^2 \bigg)$$. Summing over all $$i=1,\ldots,k$$ yields

$$ f^k - f^* \leq \frac{L}{2k} \norm{x^0-x^*}^2. \qquad \text{ (Sublinear rate)} \nonumber $$

- If $$\mu>0$$, from (2) we have $$\norm{x^k-x^*}^2 \leq \big( 1-\frac{\mu}{L} \big) \norm{x^{k-1}-x^*}^2$$. Thus a simple recursion yields

$$ \norm{x^k-x^*}^2 \leq \big( 1-\frac{\mu}{L} \big)^k \norm{x^0-x^*}^2. \qquad \text{ (Linear rate) } \nonumber $$

Remark 1.
: Notice the difference among bounds on function value and bounds on domain side. The convergence rate hence depends on which sequence is considered.
- From (1), we can derive a better bound:  
$$ \begin{align*} f^{k-1}-f^k &\geq \frac{1}{2L} \norm{\nabla f^{k-1}}^2 \geq \frac{\mu}{L} (f^{k-1}-f^*) \\ \Rightarrow f^k-f^* &\leq (1-\frac{\mu}{L})^k (f^0-f^*) \end{align*}$$
- From Theorem 4, choosing $$\eta=\frac{2}{L+\mu}$$ results in the optimal rate:  
$$ \begin{align*} &\norm{x^k-x^*} \leq (1-\frac{2\mu}{L+\mu})^k \norm{x^0-x^*}, \\ &f^k-f^* \leq \frac{L}{2} (1-\frac{2\mu}{L+\mu})^{2k} \norm{x^0-x^*}^2. \end{align*} $$
- The proof for backtracking line search relies on the fact that the step size $$\eta_k \geq \min\{\beta, \frac{\eta_0}{L} \}$$.


# 3. Proximal Gradient Descent (PGD)
Consider $$g(x)=f(x)+h(x)$$ where the regularization term $$h(x)$$ is convex. The PGD update is  

$$ x^k= \text{prox}_{h/L} \Big(x^{k-1}-\frac{1}{L} \nabla f(x^{k-1})\Big) = x^{k-1} - \frac{1}{L} G(x^{k-1}) \nonumber $$ 

where $$ G(x)=L \cdot \big( x^{k-1} - \text{prox}_{h/L} (x^{k-1}-\frac{1}{L}x^{k-1}) \big) $$. Similar to GD, we have

$$ \begin{align*}
g^k &= f^k+h^k \\
&\leq \bigg( f^{k-1} - \langle \nabla f^{k-1}, \frac{1}{L} G^{k-1} \rangle + \frac{1}{2L} \norm{G^{k-1}}^2 \bigg) + \bigg( h^* + \langle \partial h^k, x^k-x^* \rangle \bigg) \\
&\leq \bigg( f^* + \langle \nabla f^{k-1}, x^{k-1}-x^* \rangle - \frac{\mu}{2} \norm{x^{k-1}-x^*}^2 \bigg) - \langle \nabla f^{k-1}, \frac{1}{L} G^{k-1} \rangle + \frac{1}{2L} \norm{G^{k-1}}^2 + h^* + \langle \partial h^k, x^k-x^* \rangle \\
&= g^* + \langle \nabla f^{k-1} + \partial h^k, x^k-x^* \rangle + \frac{1}{2L} \norm{G^{k-1}}^2 - \frac{\mu}{2} \norm{x^{k-1}-x^*}^2
\end{align*} $$

Since $$G^{k-1}-\nabla f^{k-1} \in \partial h^{k}$$, we get

$$ \begin{align*}
g^k &\leq g^* + \langle G^{k-1}, x^k-x^* \rangle + \frac{1}{2L} \norm{G^{k-1}}^2 - \frac{\mu}{2} \norm{x^{k-1}-x^*}^2 \\
&= g^* + \langle G^{k-1}, x^{k-1}-x^* \rangle - \frac{1}{2L} \norm{G^{k-1}}^2 - \frac{\mu}{2} \norm{x^{k-1}-x^*}^2 \\
&= \frac{L}{2} \bigg( \big( 1-\frac{\mu}{L} \big) \norm{x^{k-1}-x^*}^2 - \norm{x^{k}-x^*}^2 \bigg)
\end{align*} $$


## References
```
1. Y. Nesterov, Introductory lectures on convex optimization: a basic course, Kluwer Academic Publishers, 2004.
```

