---
title: "Rosella Curves"
image: "/assets/images/rosella-curves.svg"
display_image: "/assets/images/rosella-curves.svg"
tagline: "A rose for Rosella"
priority: 5.1
description: ""
---

I wanted to make something for my mom's birthday. Her name is Rosella and her favorite color is purple, so I thought it would be fun to make a purple rose-inspired image. 

## Technical Implementation
The image is created using a variant of <a href="https://en.wikipedia.org/wiki/Rose_(mathematics)" target="_blank">rose curves</a> where the radius is also a function of the angle. The image uses 8 curves with radii chosen so that the curves are connected. The result is a single curve resembling an abstract rose. Another rose-inspired image is [here](https://mattmotoki.github.io/art/planet-rosella.html).

```python
import numpy as np
import matplotlib.pyplot as plt
    
x, y = [], []
t = np.linspace(2*np.pi, 0, 999)
for i in range(8):
    r = np.cos((i+1/2)*t) + 2*i + 2
    x.extend(+r*np.sin(t))
    y.extend(-r*np.cos(t))

plt.figure(facecolor=None)    
plt.plot(x, y, '#90f', linewidth=2)
plt.axis('equal')
plt.axis('off')
plt.show()
```
