---
title: "The Bore Model"
image: "/assets/images/bore-atom.svg"
display_image: "/assets/images/bore-atoms.svg"
tagline: "A playful take on the Bohr model"
description: ""
---


## Technical Implementation
 This piece is inspired by the <a href="https://en.wikipedia.org/wiki/Bohr_model" target="_blank">Bohr model</a> of the atom, where electrons move in quantized orbits around a nucleus. The visualization reinterprets atomic structure through harmonic motion and polar curves.

```python
import numpy as np
import matplotlib.pyplot as plt
from itertools import product

colors = ['#36F','#F70','#F0F','#F36','#0C0']
t = np.linspace(2*np.pi, 0, 999)

fig, axes = plt.subplots(3, 4)
for i, j in product(range(3), range(4)):
    ax = axes[i, j]
    for k in range(i + 2)[::-1]:
        r = np.cos(k*(k + j + 1)*t) + k
        x, y = r*np.sin(t), r*np.cos(t)
        ax.plot(x, y, colors[(i+j+k)%5])
plt.show()
```
