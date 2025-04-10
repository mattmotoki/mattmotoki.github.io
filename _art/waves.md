---
title: "Vulfpeck Waves"
image: "/assets/images/vulfpeck-waves.svg"
display_image: "/assets/images/vulfpeck-waves-wide.svg"
tagline: "Work in Progres"
priority: 2.0
description: ""
visible: false
---




## Technical Implementation
Trying to make something like waves using ideas from [here](https://mattmotoki.github.io/art/thrill-of-the-arts.html). 


```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline

plt.figure(figsize=(5,5))

n_midpoints = 20
for i in range(20):
    x = np.arange(n_midpoints+2)
    
    angles = i * np.linspace(0.1, 0.2, n_midpoints)
    y = [{0:np.sin, 1:np.cos}[i%2](x) for i,x in enumerate(angles)]
    y = i + np.concatenate([[0], y, [0]])

    xs = np.linspace(0, 12, 101)
    ys = make_interp_spline(x, y, k=3)(xs)
    
    c = plt.cm.ocean(i / 19)
    plt.plot(xs, ys, color=c, linewidth=3)


plt.axis('off')
plt.show()
```
