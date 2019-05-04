---
title: cpp之map
updated: 1551018203
date: 2019-01-26 09:55:24
tags:
 - cpp
---

## 赋值/输出

```cpp
map <string, int> fuck;
map <string, int>::iter;
for (iter = fuck.begin(); iter != fuck.end(); iter ++)
{
    fuck["***"] = 1;
    cout << iter->first << iter->second;
}
```

## 其他

[cnblog](https://www.cnblogs.com/fnlingnzb-learner/p/5833051.html)
