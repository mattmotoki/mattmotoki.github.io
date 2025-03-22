---
title: "Rosella Curves"
image: "/assets/images/rosella-curves.svg"
display_image: "/assets/images/rosella-curves.svg"
tagline: "A rose for Rosella"
priority: 5.1
description: ""
---

<!-- I wanted to make something for my mom's birthday. Her name is Rosella and her favorite color is purple (hex #90f), so I thought it would be fun to make a purple rose-inspired image.  -->

## Technical Implementation
The image is created using a variant of [rose curves](https://en.wikipedia.org/wiki/Rose_(mathematics)) where the radius is also a function of the angle. The image uses 8 curves with radii chosen so that the curves are connected. The result is a single curve resembling an abstract rose. Another rose-inspired image is [here](https://mattmotoki.github.io/art/planet-rosella.html).

```python
import numpy as np
import matplotlib.pyplot as plt
    
fig, ax = plt.subplots()
fig.set_facecolor('k')
ax.set_aspect('equal')
ax.axis('off')

x, y = [], []
t = np.linspace(2*np.pi, 0, 999)
for i in range(8):
    r = np.cos((i+1/2)*t)+2*i+2
    x.extend(+r*np.sin(t))
    y.extend(-r*np.cos(t))
ax.plot(x, y, '#90f', linewidth=2)
plt.show()
```
