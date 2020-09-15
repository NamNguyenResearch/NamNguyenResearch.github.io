---
title: "Projected Gradient Descent"
collection: notes
permalink: /notes/2017/PGD
date: 2020-09-13
excerpt: As a follow-up from my previous note on convex optimization, this note studies the so-called projected gradient descent method and its sibling, proximal gradient descent. Using the fundamental inequalities from convex analysis, we shall show that both of the methods enjoy similar convergence properties to gradient descent for unconstrained optimization.
enable: true
<!--tags:
  - convex optimization
  - convergence analysis-->
---


---
# 1. Projected gradient descent
Consider the following constrained minimization problem:

$$ \DeclareMathOperator*{\argmin}{argmin} \newcommand{\C}{\mathcal C} \newcommand{\P}{\mathcal P} \newcommand{\bm}[1]{\boldsymbol#1} \newcommand{\norm}[1]{\left\lVert#1\right\rVert} \min_{\bm x \in \C} f(\bm x) , \tag{1} \label{constrained}$$

where $\C \subseteq \mathbb{R}^n$ is a closed convex set and $f: \mathbb{R}^n \to \mathbb{R}$ is a $L$-smooth convex function. Starting at some $\bm x^0 \in \C$, the projected gradient descent (GD) method iteratively updates the value of $\bm x$ by performing

$$ \bm x^{k+1} = \P_\C \bigl(\bm x^k - \frac{1}{L} \nabla f(\bm x^k)\bigr) \tag{2} \label{projected} $$

where $\P_\C: \mathbb{R}^n \to \mathbb{R}^n$ is the projection onto $\C$, defined by

$$ \P_\C(\bm x) = \argmin_{\bm z \in \C} \frac{1}{2} \norm{\bm z - \bm x}^2 . $$

Note that here $\norm{\cdot}$ is the Euclidean norm and the step size $1/L$ is used for simplicity. 

Theorem 1. (Theorem 2.2.5 in [1])
: $\bm x^\star$ is a optimal solution of problem (\ref{projected}) if and only if $\langle \nabla f(\bm x^\star) , \bm x - \bm x^\star \rangle \geq 0$ for all $\bm x \in \C$.

Theorem 2.
: For any $\bm y \in \mathbb{R}^n$ and $\bm t \in \C$, the projection $\P_\C$ satisfies:
1. $\norm{\P_\C(\bm x) - \bm x} \leq \norm{\bm t - \bm x}$,
2. $\langle \bm t - \P_\C(\bm x), \bm x - \P_\C(\bm x) \rangle \leq 0$,
3. $\norm{\P_\C(\bm x) - \bm t} \leq \norm{\bm x - \bm t}$,
4. $\norm{\P_\C(\bm x) - \P_\C(\bm y)}^2 \leq \langle \P_\C(\bm x) - \P_\C(\bm y), \bm x - \bm y \rangle \leq \norm{\bm x - \bm y}^2$.

The proofs of Theorem 1 and 2 are left as warm-up exercises for interested readers. Let us now prove the convergence of projected GD. For notational simplicity, denote $f^k=f(\bm x^k)$, $\nabla f^k=\nabla f(\bm x^k)$. First, by definition, each iterate (\ref{projected}) can be viewed as the minimization of a quadratic approximation of the objective function:
\begin{align} \bm x^{k+1} &= \argmin_{\bm x \in \C} \frac{1}{2}\norm{\bm x - \bigl( \bm x^k - \frac{1}{L} \nabla f^k \bigr)}^2 \\\\\\ 
&= \argmin_{\bm x \in \C} f^k + \langle \nabla f^k, \bm x - \bm x^k \rangle + \frac{L}{2} \norm{\bm x - \bm x^k}^2 .
\end{align}
Thus, applying Theorem 1 to this quadratic objective, we have

$$ \langle \nabla f^k + L(\bm x^{k+1} - \bm x^k), \bm x - \bm x^{k+1} \rangle \geq 0 , \quad \text{for all } \bm x \in \C . \tag{3} \label{optimal} $$ 

Define the gradient mapping as $\bm G(\bm x) = L \Bigl(\bm x - \P_\C \bigl(\bm x - \frac{1}{L} \nabla f(\bm x)\bigr) \Bigr)$ and denote $\bm G^k=\bm G(\bm x^k)$. We can rewrite the projected GD update as a generalized GD update

$$ \bm x^{k+1} = \bm x^k - \frac{1}{L} G^k . \tag{4} \label{generalized} $$

Now by the smoothness of $f$ at $\bm x^k$, we have
\begin{align} f^{k+1} &\leq f^k + \langle \nabla f^k, \bm x^{k+1} - \bm x^k \rangle  + \frac{L}{2} \norm{\bm x^k- \bm x^k}^2 \\\\\\
&= f^k - \langle \nabla f^k, \bm x^k - \bm x^{k+1} \rangle  + \frac{1}{2L} \norm{\bm G^k}^2 . \tag{5} \label{Pdescent} \end{align}
Applying (\ref{optimal}) with $\bm x = \bm x^k$ to (\ref{Pdescent}), we can further show that the objective function decreases monotonically through iterations:
\begin{align} f^{k+1} &\leq f^k + \langle L(\bm x^{k+1} - \bm x^k ), \bm x^k - \bm x^{k+1} \rangle + \frac{1}{2L} \norm{\bm G^k}^2 \\\\\\
&= f^k - \langle \bm G^k, \frac{1}{L} \bm G^k \rangle + \frac{1}{2L} \norm{\bm G^k}^2 \\\\\\
&= f^k - \frac{1}{2L} \norm{\bm G^k}^2 .
\end{align}
Following the same [telescoping argument for gradient descent](https://trungvietvu.github.io/notes/2017/ConvexOptimization), projected GD converges sublinearly to a fixed point of problem (\ref{constrained}). When $f$ is convex, one can use Theorem 1 and (\ref{optimal}) to show that any global minimizer $\bm x^\star$ of (\ref{constrained}) is equivalent to a fixed point of the projected GD update (\ref{projected}). In order to utilize the strong convexity, we recall the following inequality

$$ f^\star \geq f^k + \langle \nabla f^k, \bm x^\star - \bm x^k \rangle + \frac{\mu}{2} \norm{\bm x^k - \bm x^\star}^2 . $$

Substituting this back into (\ref{Pdescent}), we obtain
\begin{align}
f^{k+1} &\leq f^\star + \langle \nabla f^k, \bm x^k - \bm x^\star \rangle - \frac{\mu}{2} \norm{\bm x^k - \bm x^\star}^2 - \langle \nabla f^k, \bm x^k - \bm x^{k+1} \rangle + \frac{1}{2L} \norm{\bm G^k}^2 \\\\\\
&= f^\star + \langle \nabla f^k, \bm x^{k+1} - \bm x^\star \rangle + \frac{1}{2L} \norm{\bm G^k}^2 - \frac{\mu}{2} \norm{\bm x^k - \bm x^\star}^2 \\\\\\
&\leq f^\star + \langle \bm G^k, \bm x^{k+1} - \bm x^\star \rangle + \frac{1}{2L} \norm{\bm G^k}^2 - \frac{\mu}{2} \norm{\bm x^k - \bm x^\star}^2 \\\\\\
&= f^\star + \langle \bm G^k, \bm x^{k} - \bm x^\star \rangle - \frac{1}{2L} \norm{\bm G^k}^2 - \frac{\mu}{2} \norm{\bm x^k - \bm x^\star}^2
\end{align}
where the second inequality is due to the optimality condition (\ref{optimal}). Again, we can follow the same derivation for [GD](https://trungvietvu.github.io/notes/2017/ConvexOptimization) to obtain

$$ f^{k+1}-f^{\star} \leq \frac{L}{2} \bigg( \Big( 1-\frac{\mu}{L} \Big) \norm{\bm x^{k}- \bm x^{\star}}^2 - \norm{\bm x^{k+1}- \bm x^{\star}}^2 \bigg) . $$

The positivity of the RHS implies the linear convergence of projected GD:

$$\norm{\bm x^k- \bm x^{\star}} \leq \Bigl( 1-\frac{\mu}{L} \Bigr)^{k/2} \norm{\bm x^0- \bm x^{\star}} .$$


# 2. Proximal gradient descent
In this section, we consider the problem of minimizing a composite function:

$$\min_{\bm x \in \mathbb{R}^n} g(\bm x) = f(\bm x) + h(\bm x) , \tag{6} \label{composite} $$

where $f$ is the same function defined in the previous section and the regularization $h: \mathbb{R}^n \to \mathbb{R}$ is convex but potentially non-smooth. Notice that if $h(\bm x)$ is the indicator function that takes $0$ when $\bm x \in \C$ and $\infty$ otherwise, problem (\ref{composite}) becomes the constrained optimization (\ref{constrained}). 

While the subgradient descent method applied directly to $g$ can obtain sublinear convergence, it is generally slow. The proximal gradient descent is proposed to address this issue by performing the following update:

$$ \bm x^{k+1} = \text{prox}_{h/L} \Big(\bm x^k-\frac{1}{L} \nabla f(\bm x^k)\Big) , \tag{7} \label{proxUpdate} $$ 

where the proximal operator is given by

$$ \text{prox}_{h/L}(\bm x) = \argmin_{\bm z \in \mathbb{R}^n} \biggl( \frac{1}{L} h(\bm z) + \frac{1}{2} \norm{\bm z - \bm x}^2 \biggr) . \tag{8} \label{proximal} $$

Theorem 3.
: Proximal mappings shares many properties with projections. In the followings, we assume $h: \mathbb{R}^n \to \mathbb{R}$ is a closed convex function.
1. There exists a unique proximal mapping of $h$.
2. $\bm u = \text{prox}_{h}(\bm x) \Leftrightarrow (\bm x - \bm u) \in \partial h(u) \Leftrightarrow h(\bm z) \geq h(\bm u) + \langle \bm x - \bm u, \bm z-\bm u \rangle$ for all $\bm z \in \mathbb{R}^n$.
3. $$\norm{\text{prox}_{h}(\bm x) - \text{prox}_{h}(\bm y)}^2 \leq \langle \text{prox}_{h}(\bm x) - \text{prox}_{h}(\bm y), \bm x - \bm y \rangle \leq \norm{\bm x - \bm y}^2$$.

The proof of the above theorem is omitted. In order to analyze the convergence of proximal GD, we can use the same approach for projected GD by defining the generalized gradient as

$$ \bm G(\bm x) = L \Bigl( \bm x - \text{prox}_{h/L} \bigl(\bm x-\frac{1}{L} \nabla f(\bm x) \bigr) \Bigr) . $$

Now the update (\ref{proxUpdate}) can be rewritten as

$$ \bm x^{k+1} = \bm x^k - \frac{1}{L} \bm G(\bm x^k) . $$

Performing a similar derivation as Section 1, we have

\begin{align}
g^{k+1} &= f^{k+1} + h^{k+1} \\\\\\
&\leq \biggl( f^k + \langle \nabla f^k, \bm x^{k+1} - \bm x^k \rangle + \frac{L}{2} \norm{\bm x^{k+1} - \bm x^k}^2 \biggr) + \biggl( h^{k} - \langle \partial h^{k+1}, \bm x^{k} - \bm x^{k+1} \rangle \biggr) \\\\\\
&= g^k + \frac{1}{2L} \norm{\bm G^k}^2 - \langle \nabla f^k + \partial h^{k+1}, \bm x^{k} - \bm x^{k+1} \rangle \\\\\\
&= g^k + \frac{1}{2L} \norm{\bm G^k}^2 - \langle \bm G^k, \frac{1}{L} \bm G^k \rangle \\\\\\
&= g^k - \frac{1}{2L} \norm{\bm G^k}^2 ,
\end{align}

where the second last equality stems from Theorem 3-2: $\bm G^k-\nabla f^k \in \partial h^{k+1}$. Thus, proximal GD converges monotonically and sublinearly to a fixed point of (\ref{proxUpdate}). When $f$ is convex, any fixed point of (\ref{proxUpdate}) is a global minimizer of (\ref{composite}) and vice versa. In the case $f$ is also $\mu$-strongly convex, we have

\begin{align}
g^{k+1} &\leq \biggl( f^k + \langle \nabla f^k, \bm x^{k+1} - \bm x^k \rangle + \frac{L}{2} \norm{\bm x^{k+1} - \bm x^k}^2 \biggr) + \biggl( h^{\star} + \langle \partial h^{k+1}, \bm x^{k+1}- \bm x^{\star} \rangle \biggr) \\\\\\
&\leq \bigg( f^{\star} + \langle \nabla f^k, \bm x^k- \bm x^{\star} \rangle - \frac{\mu}{2} \norm{\bm x^k- \bm x^{\star}}^2 \bigg) - \langle \nabla f^k, \frac{1}{L} \bm G^k \rangle + \frac{1}{2L} \norm{\bm G^k}^2 + \biggl( h^{\star} + \langle \partial h^{k+1}, \bm x^{k+1}- \bm x^{\star} \rangle \biggr) \\\\\\
&= g^{\star} + \langle \nabla f^k + \partial h^{k+1}, \bm x^{k+1}- \bm x^{\star} \rangle + \frac{1}{2L} \norm{\bm G^k}^2 - \frac{\mu}{2} \norm{\bm x^k- \bm x^{\star}}^2 .
\end{align}

Substituting $\bm G^k-\nabla f^k \in \partial h^{k+1}$ into the second term yields

\begin{align}
g^{k+1} &\leq g^{\star} + \langle \bm G^k, \bm x^{k+1}- \bm x^{\star} \rangle + \frac{1}{2L} \norm{\bm G^k}^2 - \frac{\mu}{2} \norm{\bm x^k- \bm x^{\star}}^2 \\\\\\
&= g^{\star} + \langle \bm G^k, \bm x^k- \bm x^{\star} \rangle - \frac{1}{2L} \norm{\bm G^k}^2 - \frac{\mu}{2} \norm{\bm x^k- \bm x^{\star}}^2 .
\end{align}

Here upon we recover the same analysis in Section 1 and obtain

$$ g^{k+1} - g^\star \leq \frac{L}{2} \bigg( \big( 1-\frac{\mu}{L} \big) \norm{\bm x^k- \bm x^{\star}}^2 - \norm{\bm x^{k+1}- \bm x^{\star}}^2 \bigg) . $$


## References
> 1. Y. Nesterov, Introductory lectures on convex optimization: a basic course, Kluwer Academic Publishers, 2004.

