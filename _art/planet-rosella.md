---
title: "Planet Rosella"
image: "/assets/images/planet-rosella.png"
display_image: "/assets/images/planet-rosella-wide.png"
tagline: "A rose for Rosella"
priority: 5.3
description: ""
---

I wanted to create something for my mom's birthday. Her name is Rosella, and her favorite color is purple, which inspired me to design an image with a rose motif.

## Technical Implementation
The image is created by simulating the idealized orbits of two planets. At discrete time intervals, a line is drawn from one planet toward the other, extending from 40% of the inner planet to 70% of the outer planet. The idea came from Professor McClure's <a href="https://marksmath.org/visualization/dance_of_earth_and_venus.html" target="_blank">Dance of Earth and Venus</a>. Another rose-inspired image is [here](https://mattmotoki.github.io/art/rosella-curves.html).

```python
import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0, 2*np.pi, 10000)

plt.figure(facecolor=None)
for xi, xo, yi, yo in zip(
    np.cos(12*t), 1.5*np.cos(7*t),
    np.sin(12*t), 1.5*np.sin(7*t),
):
    x = np.linspace(xi, xo, 11)[4:8]
    y = np.linspace(yi, yo, 11)[4:8]    
    plt.plot(x, y, '#9D00FF09')
plt.axis('equal')
plt.axis('off') 
plt.show()
```
