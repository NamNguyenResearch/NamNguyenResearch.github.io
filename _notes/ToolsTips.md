---
title: "Tools and Tips"
collection: notes
permalink: /note/2019/ToolsTips
date: 2019-02-02
enable: true
excerpt: Some useful tools and tips I often use in my research. 
---

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

- Algorithms

```latex
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}

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

---
# Matlab

- Fix font for figures in papers

```matlab
setaxs = 'set(get(gca,';
fontsty = [' ''Fontname'',''times'', ''FontSize'',12, ''Fontweight'',''normal'', '...
            ,' ''Fontangle'',''normal''); '];

eval( [setaxs '''xlabel''' '),' fontsty] );
eval( [setaxs '''ylabel''' '),' fontsty] );
eval( [setaxs '''zlabel''' '),' fontsty] );
eval( [setaxs '''title'''  '),' fontsty] );
eval( ['set(gca,'               fontsty] );

leg = legend;
eval( ['set(leg,'               fontsty] );
```

---
# Webpages

- Markdown
	- Cheat sheet: [https://en.support.wordpress.com/markdown-quick-reference/](https://en.support.wordpress.com/markdown-quick-reference/)








