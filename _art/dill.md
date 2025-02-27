---
title: "Dill"
image: "/assets/images/dill.png"
display_image: "/assets/images/dill-large.png"
tagline: "A fractal-like visualization resembling the dill herb."
description: "This code generates a fractal-like pattern that resembles the delicate, feathery structure of dill. The algorithm uses recursive branching patterns to create the organic, plant-like appearance."
---


```python
import numpy as np
import matplotlib.pyplot as plt

def create_branch(start, angle, length, depth, max_depth):
    if depth > max_depth:
        return
    
    end = start + length * np.array([np.cos(angle), np.sin(angle)])
    plt.plot([start[0], end[0]], [start[1], end[1]], color='green', alpha=0.3)
    
    if depth < max_depth:
        num_branches = np.random.randint(1, 4)
        for _ in range(num_branches):
            new_angle = angle + np.random.uniform(-0.5, 0.5)
            new_length = length*np.random.uniform(0.75, 0.9)
            create_branch(end, new_angle, new_length, depth + 1, max_depth)

np.random.seed(0)

_, ax = plt.subplots(figsize=(5, 5))
for i in range(10):
    angle = 0.01*np.pi*i + 0.45*np.pi
    length = np.random.uniform(0.1, 0.25)
    create_branch([0, 0], angle, length, 0, max_depth=8)

ax.set_aspect('equal'); plt.axis('off'); plt.tight_layout()
plt.savefig("dill-large.png", transparent=True, dpi=300)
plt.show()
```