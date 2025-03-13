---
title: "Sand and Sky"
image: "/assets/images/sand-and-sky.png"
tagline: "A fading horizon where sand meets skys."
description: ""
---

## Technical Implementation
The code generates a fading horizon by creating a smooth blue to beige gradient and applying random rectangular smoothing for a coarse natural look. 

```python
import numpy as np
from random import randint
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap

n = 1000
values = np.repeat([range(n)], n, axis=0).T
for _ in range(100):
    w, h = randint(20, n//2), randint(20, n//10)
    x, y = randint(0, n - w), randint(0, n - h)
    idx = slice(y, y+h), slice(x, x+w)
    values[*idx] = np.mean(values[*idx])

positions = [0.0, 0.2, 0.75, 1.0]
colors = ['#6DAED5', '#87CEEB', '#F7D8BF', '#E5BB98']
cmap = LinearSegmentedColormap.from_list(
    'sand-and-sky', list(zip(positions, colors)))
plt.imshow(values, aspect='auto', cmap=cmap)
plt.axis('off')
plt.show()
```
