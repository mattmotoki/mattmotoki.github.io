---
title: "Digital Dill"
image: "/assets/images/dill.png"
display_image: "/assets/images/dill-large.png"
tagline: "A fractal-like visualization resembling the dill herb"
priority: 4
description: ""
---

## Technical Implementation
The algorithm uses recursive branching patterns to create a natural-looking tree structure, with each branch splitting into smaller branches at varying angles.

```python
import numpy as np
import matplotlib.pyplot as plt

def create_branch(i, d, t, L, d_max=8):
    if d >= d_max: return
    j = i + L*np.array([np.cos(t), np.sin(t)])
    plt.plot(*list(zip(i,j)), 'g', alpha=0.3)
    for _ in range(np.random.randint(1, 4)):
        t_new = t - np.random.rand() + 0.5
        L_new = L*np.random.uniform(0.75, 0.9)
        create_branch(j, d+1, t_new, L_new)

np.random.seed(0)
_, ax = plt.subplots(figsize=(5, 5))
for i in range(10):
    t = 0.01*np.pi*i + 0.45*np.pi
    L = np.random.uniform(0.1, 0.25)
    create_branch([0, 0], 0, t, L)
plt.show()
```