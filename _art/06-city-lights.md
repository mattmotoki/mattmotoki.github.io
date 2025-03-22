---
title: "City Lights"
image: "/assets/images/city-lights.png"
tagline: "A stylized skyline with randomly placed buildings and illuminated windows."
description: ""
---

## Technical Implementation
The code generates a stylized city skyline at night. The algorithm randomly places buildings of different heights and adds illuminated windows to create a nighttime urban landscape.

```python
import colorsys
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
            
np.random.seed(42)
n_buildings = np.random.randint(25, 50)
offsets = np.random.rand(n_buildings) * 100
heights = np.random.randint(5, 55, n_buildings)
widths = np.random.randint(3, 10, n_buildings)

rgb1 = mcolors.to_rgb('#fffdf2')
rgb2 = mcolors.to_rgb('#594e00')
hls1 = colorsys.rgb_to_hls(*rgb1)
hls2 = colorsys.rgb_to_hls(*rgb2)

yellows = []
for t in np.linspace(0, 1, 54):
    h = hls1[0] + t * (hls2[0] - hls1[0])
    l = hls1[1] + t * (hls2[1] - hls1[1])
    s = hls1[2] + t * (hls2[2] - hls1[2])
    rgb = colorsys.hls_to_rgb(h, l, s)
    hex_color = mcolors.to_hex(rgb)
    yellows.append(hex_color)
yellows = np.array(yellows)
    
fig, ax = plt.subplots(facecolor='none')
for x, h, w in zip(offsets, heights, widths):
    
    n = max(np.random.randint(w**0.5*h), 10)
    i = (5*np.random.randn(n) + 40).astype(int)
    colors = yellows[np.minimum(i, 50)]
    x_pos = np.floor((w-1)*np.random.rand(n))
    y_pos = np.floor((h-1)*np.random.rand(n))
    x_pos += x + (1.5 - w)/2
    y_pos += 1.5/2
    
    ax.bar(x, h, w, color='#333')
    for p,c in zip(zip(x_pos, y_pos), colors):
        r = plt.Rectangle(p, 0.5, 0.5, color=c)
        ax.add_patch(r)
        
ax.get_xaxis().set_visible(False)
ax.get_yaxis().set_visible(False)
ax.set_xlim(-10, 110)
ax.set_ylim(0, 60)
ax.set_aspect('equal', 'box')
ax.set_axis_off()
plt.tight_layout()
plt.show()
```
