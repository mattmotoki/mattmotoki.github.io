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
f0x = 4*np.sin(t + 2)
f0y = 2*np.sin(2*t + 3)
f1x = 3*np.sin(t + 2)
f1y = 4*np.sin(t + 2)

cx, cy = (f0x + f1x)/2, (f0y + f1y)/2
dx, dy = f1x - f0x, f1y - f0y

a = 2
c = np.sqrt(dx*2 + dy**2) / 2
b = np.sqrt(np.maximum(0, a**2-c**2))
phi = np.arctan2(dy, dx)

x, y = a*np.cos(t), b*np.sin(t)
cx += x*np.cos(phi) - y*np.sin(phi)
cy += x*np.sin(phi) + y*np.cos(phi)

plt.plot(cx, -cy, linewidth=2)
plt.axis('off')
plt.show()    
```

