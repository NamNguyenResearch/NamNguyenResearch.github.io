---
title: "Miscellaneous"
collection: notes
permalink: /notes/2019/Tips
date: 2019-02-02
enable: false
excerpt: A quick reference to the list of items that I often use in my research. 
---


Below is a quick reference to the list of items that I often use in my research. 

---
# Latex

- Common packages

```latex
\usepackage{amsmath,graphicx}
\usepackage[utf8]{inputenc}
\usepackage{amssymb}
\usepackage{epstopdf}
\usepackage{amsthm}
\usepackage{bm}
\usepackage{cite}
\usepackage{soul,color}
```

- Narrow the margin

```latex
\usepackage{geometry}
\geometry{
	letterpaper,
	total={6.5in,9in},
	left=1in,
	top=1in,
}
```

- Define shortcuts

```latex
\newcommand{\R}{\mathbb R}
```

- New operators

```latex
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}
```

- Scale table

```latex
\resizebox{\linewidth}{!}{
\begin{tabular} ...
}
```

- Scale equations

```latex
\newcommand{\Scale}[2][4]{\scalebox{#1}{$#2$}}

\begin{align*}
\Scale[0.85]{ x+y=1 }
\end{align*}
```

- Algorithms

```latex
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}

\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}

\begin{algorithm}[H]
\caption{ARNAG-IHT}
\label{algo_adapt}
\begin{algorithmic}[1]
\State $t=1$
\State $f_0=\norm{X^{(0)}_\S-M_\S}_F^2$
\For{$k=0,1,2,\ldots$}
\State $X^{(k+1)}=\P_{r} \big( Y^{(k)} \big)$
\State $Y^{(k+1)} = \P_{M,\S}\big( X^{(k+1)} + \textcolor{red}{\frac{t-1}{t+2}} (X^{(k+1)}-X^{(k)}) \big)$
\State $f_{k+1}=\norm{X^{(k+1)}_\S-M_\S}_F^2$
\IfThenElse{$\textcolor{red}{f_{k+1} > f_{k}}$} {$t = 1$} {$t=t+1$} \Comment{function scheme}
\EndFor 
\end{algorithmic}
\end{algorithm}
```

- Align algorithms and texts in two-column mode

```latex
\makeatletter
\newcommand\fs@betterruled{
  \def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
  \def\@fs@pre{\vspace*{5pt}\hrule height.8pt depth0pt \kern2pt}
  \def\@fs@post{\kern2pt\hrule\relax}
  \def\@fs@mid{\kern2pt\hrule\kern2pt}
  \let\@fs@iftopcapt\iftrue}
\floatstyle{betterruled}
\restylefloat{algorithm}
\makeatother
```

---
# Matlab

- Fix font for figures in papers

```matlab
setaxs = 'set(get(gca,';
fontsty = [' ''Fontname'',''times'', ''FontSize'',12, ''Fontweight'',''normal'', ',' ''Fontangle'',''normal''); '];

eval( [setaxs '''xlabel''' '),' fontsty] );
eval( [setaxs '''ylabel''' '),' fontsty] );
eval( [setaxs '''zlabel''' '),' fontsty] );
eval( [setaxs '''title'''  '),' fontsty] );
eval( ['set(gca,'               fontsty] );

leg = legend;
eval( ['set(leg,'               fontsty] );
```

- CVX

```matlab
cvx_begin quiet
    variable x_cvx(n)
    expression xg
    for g=1:G
        if g<G
            xg(g) = norm(x_cvx(h*(g-1)+1:h*g),2);
        else
            xg(g) = norm(x_cvx(h*(g-1)+1:end),2);
        end
    end
    minimize(sum_square_abs(y-A*x_cvx) + lambda*sum(xg))
    subject to
        ones(1,n)*x_cvx == 1    
        x_cvx >= 0        
cvx_end
```

- Create random unitary matrix (QR decomposition)

```matlab
X = (randn(n) + i*randn(n))/sqrt(2);
[Q,R] = qr(X);
R = diag(diag(R)./abs(diag(R)));
U = Q*R;
```


---
# Commandline

- Search history: *Ctrl-R*

```console
(reverse-i-search)`':
```

- Recursively search all files for a string

```console
find </path/to/dir> -type f -print0 | xargs -0 grep -l <keyword>
```

- Transfering files (commonly used)

```console
scp -rv <source_files> <des_files>
```

---
# Webpages

- Markdown
	- Cheat sheet: [https://en.support.wordpress.com/markdown-quick-reference/](https://en.support.wordpress.com/markdown-quick-reference/)

- Blogs
	- [Terence Tao](https://terrytao.wordpress.com/)
	- [Alex McFarlane](https://flipdazed.github.io)






