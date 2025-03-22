---
title: "Planet Rosella"
image: "/assets/images/planet-rosella.png"
display_image: "/assets/images/planet-rosella-wide.png"
tagline: "A rose for Rosella"
priority: 5.3
description: ""
---

<!-- I wanted to make something for my mom's birthday. Her name is Rosella and her favorite color is purple (hex #9D00FF), so I thought it would be fun to make a purple rose-inspired image.  -->

## Technical Implementation
The image is created by simulating the orbits of two planets. At discrete time intervals, a line is drawn from one planet toward the other, extending from the inner planet out to 70% of outer planet. The idea came from Professor McClure's <a href="https://marksmath.org/visualization/dance_of_earth_and_venus.html" target="_blank">Dance of Earth and Venus</a>. Another rose-inspired image is [here](https://mattmotoki.github.io/art/rosella-curves.html).

```python
import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0, 2*np.pi, 10000)

plt.figure(facecolor=None)
for xi, xo, yi, yo in zip(
    np.cos(12*t), 1.5*np.cos(7*t),
    np.sin(12*t), 1.5*np.sin(7*t),
):
    x = np.linspace(xi, xo, 10)[:7]
    y = np.linspace(yi, yo, 10)[:7]    
    plt.plot(x, y, '#9D00FF05')
plt.axis('equal')
plt.axis('off') 
plt.show()
```
