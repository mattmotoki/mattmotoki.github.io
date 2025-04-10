---
title: "Instant Ramen"
image: "/assets/images/instant-ramen.svg"
display_image: "/assets/images/instant-ramen.svg"
tagline: "It's best eaten dry"
priority: 2
description: ""
---




## Technical Implementation
I was messing around with the ideas [here](https://mattmotoki.github.io/art/thrill-of-the-arts.html) and got something that looked kind of like dried instant ramen. 


```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline

plt.figure(figsize=(5,5))
for i in range(25):
    for j in range(3):
        x = np.arange(22)

        scales = 1 + 0.3*np.random.randn(20)
        angles = j + i*np.linspace(0.1, 0.5, 20)

        y = [{0:np.sin, 1:np.cos}[i%2](t) for i,t in enumerate(angles)]
        y = i + np.concatenate([[0], scales*y, [0]])

        xs = np.linspace(0, x.max(), 101)
        ys = make_interp_spline(x, y, k=3)(xs)
        plt.plot(xs, ys, color='y')
plt.axis('off')
plt.show()

```
