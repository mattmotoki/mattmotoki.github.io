---
title: "Black Holes"

image: "/assets/images/black-holes-thumbnail.svg"
display_image: "/assets/images/black-holes-wide.svg"
tagline: "Sketches from the event horizon"
description: ""
---

## Technical Implementation
The code creates an abstract representation of black holes by first generating a Voronoi diagram (which partitions space into regions based on random points) and then drawing spiraling patterns within each region by repeatedly interpolating between consecutive vertices.

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.spatial import Voronoi

np.random.seed(1)

def spiral(ax, p):
    for i in range(5000):
        p.append(p[i] + 0.05*(p[i+1] - p[i]))
    ax.plot(*zip(*p), 'm', lw=0.3, alpha=0.7)

w, h, b, n = 10, 5, 10, 7
V = Voronoi(np.vstack([
    np.array([w, h])*np.random.rand(n, 2), [
    [w,h+b], [-b,h+b], [w+b,-b], [-b,h],  
    [w,-b], [-b,-b], [w+b,h+b], [w+b,h],
]]))

_, ax = plt.subplots(figsize=(w, h))
for i in V.point_region:
    if -1 in (r := V.regions[i]): continue
    spiral(ax, [V.vertices[i] for i in r])
plt.xlim(0, w); plt.ylim(0, h); 
ax.axis('off'); plt.show()
```
