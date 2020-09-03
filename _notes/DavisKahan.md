---
title: "Matrix Perturbation and Davis-Kahan Theorem"
collection: notes
permalink: /notes/2020/DavisKahan
date: 2020-06-20
excerpt: In this note we will study matrix perturbation theory and find out the answer to some basic questions such as what happens when adding small perturbations to a symmetric matrix, or how much the invariant subspace spanned by its eigenvectors can change. Understanding the effect of small perturbation on matrices is the key to analysis of local convergence in many optimization algorithms.  
enable: true
---


---
# 1. Eigensubspace decomposition and matrix perturbation

Let $\DeclareMathOperator*{\argmin}{argmin} \DeclareMathOperator*{\argmax}{argmax} \newcommand{\norm}[1]{\left\lVert#1\right\rVert} \newcommand{\abs}[1]{\left\lvert#1\right\rvert} \newcommand{\bm}[1]{\boldsymbol#1} \bm M \in \mathbb{R}^{n \times n}$ be a symmetric matrix with eigenvalue decomposition (EVD) $\bm M=\bm U \bm \Lambda \bm U^T$. Here $\bm U \in \mathbb{R}^{n \times n}$ is an orthogonal matrix, i.e., $\bm U^T \bm U = \bm U \bm U^T = \bm I_n$, and $\bm \Lambda=\text{diag}(\lambda_1,\lambda_2,\ldots,\lambda_n)$ has the eigenvalues of $\bm M$ as its diagonal entries. Given an integer $r<n$, we can define the eigensubspace decomposition as the partition

\begin{align} \bm M = \begin{bmatrix} \bm U_1 & \bm U_2 \end{bmatrix} \begin{bmatrix} \bm \Lambda_1 & \bm 0 \\\ \bm 0 & \bm \Lambda_2 \end{bmatrix} \begin{bmatrix} \bm U_1^T \\\ \bm U_2^T \end{bmatrix}, \tag{1} \label{M}
\end{align}

where $\bm \Lambda_1 = \text{diag}(\lambda_1,\ldots,\lambda_r)$ and $\bm \Lambda_2 = \text{diag}(\lambda_{r+1},\ldots,\lambda_n)$. The submatrices $\bm U_1$ and $\bm U_2$ are called *semi-orthogonal* since $\bm U_1^T \bm U_1 = \bm I_r$ and $\bm U_2^T \bm U_2 = \bm I_{n-r}$. The orthogonal projections onto the subspaces spanned by the columns of $\bm U_1$ and $\bm U_2$ are $\bm P_{\bm U_1} = \bm U_1 \bm U_1^T$ and $\bm P_{\bm U_2} = \bm U_2 \bm U_2^T$, respectively. Since $\bm P_{\bm U_1} + \bm P_{\bm U_1} = \bm I_n$, the two corresponding subspaces are orthogonal complement.

Now let $\bm \Delta \in \mathbb{R}^{n \times n}$ be a small perturbation (symmetric), we are interested in how the eigenvalues and eigenvectors of $\bm M$ change. Denote the eigensubspace decomposition of $\tilde{\bm M} = \bm M + \bm \Delta$ by

\begin{align} \tilde{\bm M} = \tilde{\bm U} \tilde{\bm \Lambda} \tilde{\bm U}^T = \begin{bmatrix} \tilde{\bm U}_1 & \tilde{\bm U}_2 \end{bmatrix} \begin{bmatrix} \tilde{\bm \Lambda}_1 & \bm 0 \\\ \bm 0 & \tilde{\bm \Lambda}_2 \end{bmatrix} \begin{bmatrix} \tilde{\bm U}_1^T \\\ \tilde{\bm U}_2^T \end{bmatrix} . \tag{2} \label{Md} 
\end{align} 

The [Weyl's theorem](https://en.wikipedia.org/wiki/Weyl%27s_inequality#Weyl's_inequality_in_matrix_theory) tells us that the eigenvalues are fairly stable under small perturbations:

Theorem 1. 
: $\norm{\tilde{\bm \Lambda} - \bm \Lambda}_2 \leq \norm{\bm \Delta}_2 .$


**Proof.**

We will prove a more general result: let $\bm A, \bm B \in \mathbb{R}^{n \times n}$ be symmetric and $\lambda_i(.)$ be the *i*th largest eigenvalue of a matrix, then

$$ \lambda_i(\bm A) + \lambda_j(\bm B) \geq \lambda_{i+j-1} (\bm A + \bm B) . $$

In order to prove the above inequality, we use [the min-max theorem](https://en.wikipedia.org/wiki/Min-max_theorem) as follows:

$$ \lambda_i(\bm A) = \min_{\mathcal{V}_A: \text{dim}(\mathcal{V}_A)=n-i+1} \max_{\bm x \in \mathcal{V}_A, \norm{\bm x}=1} \bm x^T \bm A \bm x \quad \text{ and } \quad \lambda_j(\bm B) = \min_{\mathcal{V}_B: \text{dim}(\mathcal{V}_B)=n-j+1} \max_{\bm x \in \mathcal{V}_B, \norm{\bm x}=1} \bm x^T \bm B \bm x .$$

Let 

$$\mathcal{V}_A^* = \argmin_{\mathcal{V}_A: \text{dim}(\mathcal{V}_A)=n-i+1}\max_{\bm x \in \mathcal{V}_A, \norm{\bm x}=1} \bm x^T \bm A \bm x \quad \text{ and } \quad \mathcal{V}_B^* = \arg\min_{\mathcal{V}_B: \text{dim}(\mathcal{V}_B)=n-j+1} \max_{\bm x \in \mathcal{V}_B, \norm{\bm x}=1} \bm x^T \bm B \bm x . $$


Denote $\mathcal{V} = \mathcal{V}_A^* \cap \mathcal{V}_B^*$, where $\text{dim}(\mathcal{V}) \geq (n-i+1)+(n-j+1)-n = n+2-i-j$. We have

$$\lambda_i(\bm A) + \lambda_j(\bm B) \geq \max_{\bm x \in \mathcal{V}, \norm{\bm x}=1} \bm x^T (\bm A + \bm B) \bm x \geq \min_{\mathcal{V}: \text{dim}(\mathcal{V}_A)=n+2-i-j} \max_{\bm x \in \mathcal{V}, \norm{\bm x}=1} \bm x^T (\bm A+\bm B) \bm x = \lambda_{i+j-1} (\bm A + \bm B) . $$

This completes our proof. $\qquad \blacksquare$


# 2. Principle angles between two subspaces
Unlike the eigenvalues, the eigenvectors are not stable under perturbation, especially when the eigenvalues are not well-separated. In order to measure the change in the eigenvectors, one may first think about the distance between $\tilde{\bm U_1}$ and $\bm U_1$, say $\norm{\tilde{\bm U_1} - \bm U_1}_F$. However, this does not take into account the rotation after perturbation. Thus, it is more accurate to measure the distance between the invariant subspaces spanned by the columns of $\tilde{\bm U_1}$ and $\bm U_1$. Let us formally define this distance as follows. Consider two tall matrices $\bm A, \bm B \in \mathbb{R}^{n \times r}$ with orthonormal columns, i.e., $\bm A^T \bm A = \bm B^T \bm B = \bm I_r. Denote their ranges by $\mathcal{A}$ and $\mathcal{B}$, respectively. The principle angles between $\mathcal{A}$ and $\mathcal{B}$ are the angles $\theta_1,\ldots,\theta_r$ such that $\cos \theta_1,\ldots,\cos \theta_r$ are the singular values of $\bm A^T \bm B$. In other words, we have the singular value decomposition (SVD)

$$ \bm A^T \bm B = \bm U \text{diag}(\cos \theta_1,\ldots,\cos \theta_r) \bm V^T = \bm U \cos \bm \theta \bm V^T. $$

It is also possible to show that $\sin \theta_1, \ldots, \sin \theta_r$ are the singular values of $\bm P_A (\bm I_n - \bm P_B)$:

$$ \bm P_A (\bm I_n - \bm P_B) = \bm A \bm U \text{diag}(\sin \theta_1,\ldots,\sin \theta_r) \bm V^T \bm B^T = \bm U \sin \bm \theta \bm V^T . $$

Now we are ready to define the distance between $\mathcal{A}$ and $\mathcal{B}$ as

$$ d(\mathcal{A},\mathcal{B}) = \norm{\sin \bm \theta}_F = \frac{1}{\sqrt{2}} \norm{\bm P_A - \bm P_B}_F = \norm{\bm A^T \bar{\bm B}}_F  $$

where $\bar{\bm B}$ is the orthogonal complement of $\bm B$, i.e., $\bm P_B + \bm P_{\bar B} = \bm I_n$. 


# 3. Orthogonal Procrustes problem

<p align="center">
  <img alt="Procrustes" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/The_Modern_Bed_of_Procustes_-_Punch_cartoon_-_Project_Gutenberg_eText_13961.png/440px-The_Modern_Bed_of_Procustes_-_Punch_cartoon_-_Project_Gutenberg_eText_13961.png">
</p>

There is an interesting relationship between the subspace distance and their corresponding basis matrix distance. In particular, we can show that 

$$
\min_{\bm R \in \mathbb{R}^{r \times r}: \bm R^T \bm R =  = \bm I_r} \norm{\bm A \bm R - \bm B}_F^2 = 2r - \max_{\bm R \in \mathbb{R}^{r \times r}: \bm R^T \bm R = \bm I_r} \text{tr}(\bm R^T \bm A^T \bm B) = 2r - \max_{\bm R \in \mathbb{R}^{r \times r}: \bm R^T \bm R = \bm I_r} \text{tr}\bigl((\bm U^T \bm R \bm V)^T \bm \cos \theta \bigr) \leq 2 d^2(\mathcal{A},\mathcal{B}) .
$$

This result is known as the [orthogonal Procrustes problem](https://en.wikipedia.org/wiki/Orthogonal_Procrustes_problem). The minimizer of the LHS is given by

$$ \hat{\bm R} = \bm U \bm V^T = \bm C (\bm C^T \bm C)^{-\frac{1}{2}}, \quad \text{ where } \bm C = \bm A^T \bm B . $$


# 4. The $\sin \bm \theta$ theorem
Let us now find an upper bound on $\sin \bm \theta(\tilde{\bm U}_1, \bm U_1) = \norm{\tilde{\bm U}_2^T \bm U_1}_F$. Consider 

$$ \tilde{\bm U}_2^T \bm \Delta \bm U_1 = \tilde{\bm U}_2^T (\tilde{\bm M} - \bm M) \bm U_1 = \tilde{\bm \Lambda}_2 \tilde{\bm U}_2^T \bm U_1 - \tilde{\bm U}_2^T \bm U_1 \bm \Lambda_1 . $$

Denote $\bm H = \tilde{\bm U}_2^T \bm U_1$, we have

$$
\norm{\tilde{\bm U}_2^T \bm \Delta \bm U_1}_F^2 = \norm{\tilde{\bm \Lambda}_2 \bm H - \bm H \bm \Lambda_1}_F^2 = tr(\tilde{\bm \Lambda}_2^2 \bm H \bm H^T) + tr(\bm \Lambda_1^2 \bm H^T \bm H) - 2 tr(\bm H^T \tilde{\bm \Lambda}_2 \bm H \bm \Lambda_1) 
$$

$$ = \sum_{j=r}^{n} \sum_{i=1}^r \bigl( \tilde{\lambda}_{2j}^2 + \lambda_{1i}^2 - 2 \tilde{\lambda}_{2j} \lambda_{1i} \bigr) H_{ji}^2 \geq \bigl( \min_{i,j} \abs{\lambda_{1i} - \tilde{\lambda}_{2j}} \bigr)^2 \sum_{i,j} H_{ji}^2 = \delta \norm{\bm H}_F^2 , $$

where $\delta = \min_{1 \leq i \leq r, r \leq j \leq n}  \abs{\lambda_{1i} - \tilde{\lambda}_{2j}}$ is the eigengap. Thus we obtain

$$ \norm{\tilde{\bm U}_2^T \bm U_1}_F \leq \frac{\norm{\tilde{\bm U}_2^T \bm \Delta \bm U_1}_F}{\delta} . $$

The above leads to the following theorems:

**Theorem 1. (Davis-Kahan theorem [1])**

Let $\bm M$ and $\tilde{\bm M}$ be two symmetric matrices with EVDs (\ref{M}) and (\ref{Md}). If $\delta = \min_{1 \leq i \leq r, r \leq j \leq n} \abs{\lambda_i - \tilde{\lambda}_j} > 0$, then

$$ \norm{\sin \bm \theta(\tilde{\bm U}_1, \bm U_1)}_F \leq \frac{\norm{\bm \Delta \bm U_1}_F}{\delta} . $$

**Theorem 2. (Wedin theorem [2])**

Let $\bm M$ and $\tilde{\bm M} \in \mathbb{R}^{m \times n}$ be two matrices with rank-$r$ SVDs:

\begin{align} \bm M = \begin{bmatrix} \bm U_1 & \bm U_2 \end{bmatrix} \begin{bmatrix} \bm \Sigma_1 & \bm 0 \\\ \bm 0 & \bm \Sigma_2 \end{bmatrix} \begin{bmatrix} \bm V_1^T \\\ \bm V_2^T \end{bmatrix}, \quad \tilde{\bm M} = \bm M + \bm \Delta = \begin{bmatrix} \tilde{\bm U}_1 & \tilde{\bm U}_2 \end{bmatrix} \begin{bmatrix} \tilde{\bm \Sigma}_1 & 0 \\\ 0 & \tilde{\bm \Sigma}_2 \end{bmatrix} \begin{bmatrix} \tilde{\bm V}_1^T \\\ \tilde{\bm V}_2^T \end{bmatrix} . 
\end{align}

If $$\delta = \min \{ \min_{1 \leq i \leq r, r \leq j \leq n}  \abs{\sigma_i - \tilde{\sigma}_j}, \min_{1 \leq i \leq r} \sigma_i \} > 0$$, then

$$ \norm{\sin \bm \theta(\tilde{\bm U}_1, \bm U_1)}_F^2 + \norm{\sin \bm \theta(\tilde{\bm V}_1, \bm V_1)}_F^2 \leq \frac{\norm{\bm U_1^T \bm \Delta}_F^2 + \norm{\bm \Delta \bm V_1}_F^2}{\delta^2} . $$

In both theorems, note that no ordering on the eigenvalues/singular values is required. Furthermore, by Weyl's theorem, one can show that the sufficient (but not necessary) condition for $\delta > 0$ in Davis-Kahan theorem is $\norm{\bm \Delta}_2 < \min_{1 \leq i \leq r, r \leq j \leq n} \abs{\lambda_i - \tilde{\lambda}_j}$.


## References
> 1. C. Davis and W.M. Kahan. The rotation of eigenvectors by a perturbation. III. SIAM Journal on Numerical Analysis, 7(1), pp.1-46, 1970.
> 2. P.Å., Wedin. Perturbation bounds in connection with singular value decomposition. BIT Numerical Mathematics, 12(1), pp.99-111, 1972.






