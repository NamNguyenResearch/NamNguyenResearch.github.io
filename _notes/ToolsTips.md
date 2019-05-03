---
title: "Tools and Tips"
collection: notes
permalink: /note/2019/ToolsTips
date: 2019-02-02
enable: true
excerpt: Some useful tools and tips I often use in my research. 
---


# Matlab
1. Fix font for figures in papers

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


# Webpages
1. Markdown
	- Cheat sheet: [https://en.support.wordpress.com/markdown-quick-reference/](https://en.support.wordpress.com/markdown-quick-reference/)








