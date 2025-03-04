---
title: "The Bore Model"
image: "/assets/images/bore-atom.svg"
tagline: "A playful take on the Bohr model."
description: ""
---


## Technical Implementation
 This piece is inspired by the Bohr model of the atom, where electrons move in quantized orbits around a nucleus. The visualization reinterprets atomic structure through harmonic motion and polar curves.

```python
import numpy as np
import matplotlib.pyplot as plt
    
_, ax = plt.subplots()
ax.set_facecolor(None)
ax.set_aspect('equal')
ax.axis('off')

t = np.linspace(8*np.pi, 0, 999)
for i in range(3):
    r = np.cos(i*(i+1/4)*t)+i
    x = r*np.sin(t)
    y = r*np.cos(t)
    ax.plot(x, y)
plt.show()
```
