---
title: "Dolphin"
image: "/assets/images/dolphin-thumbnail.svg"
display_image: "/assets/images/dolphin-wide.svg"
tagline: "An unexpected Lissajous curve of a dolphin"
priority: 2
description: ""
---



## Technical Implementation

I was playing around with <a href="https://en.wikipedia.org/wiki/Lissajous_curve" target="_blank">Lissajous curves</a> and this popped out. 


```python
import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0, 2*np.pi, 1000)
x0 = 4*np.sin(t + 2)
y0 = 2*np.sin(2*t + 3)
x1 = 3*np.sin(t + 2)
y1 = 4*np.sin(t + 2)

dx, dy = x1 - x0, y1 - y0
b = 4 - (dx**2 + dy**2) / 4
b = np.sqrt(np.maximum(0, b))
x, y = 2*np.cos(t), b*np.sin(t)

phi = np.arctan2(dy, dx)
cx, cy = (x0 + x1)/2, (y0 + y1)/2
cx += x*np.cos(phi) - y*np.sin(phi)
cy += x*np.sin(phi) + y*np.cos(phi)

plt.plot(cx, -cy, linewidth=2)
plt.axis('off')
plt.show()    
```

