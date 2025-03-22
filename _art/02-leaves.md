---
title: "Leaves"
image: "/assets/images/leaves-thumbnail.png"
display_image: "/assets/images/leaves-wide.png"
tagline: "A collection of seasonal fallen leaves."
description: ""
---

## Technical Implementation
The code generates a collection of leaf shapes with veins by defining functions to create the leaf structure and veins, and then randomly positions them on a plot using different color palettes for a natural appearance.


```python
import numpy as np, matplotlib.pyplot as plt
from matplotlib.patches import Path, PathPatch

PALETTE_MAP = {
    'forest': ['#2E8B57', '#3CB371', '#66CDAA', '#8FBC8F'],
    'autumn': ['#8B2B00', '#D2691E', '#CD853F', '#DEB887'],
    'winter': ['#E8F1F2', '#D6E5F3', '#B8D0E6', '#9AB4D9'],
    'summer': ['#228B22', '#32CD32', '#90EE90', '#98FB98'],
    'sunset': ['#FFCC00', '#FF9900', '#FF6666', '#FF3333']
}

def create_leaf(center, length, angle, width_factor=0.5, asymmetry=0.15):
    x, y = center; tip_x, tip_y = x + length*np.cos(angle), y + length*np.sin(angle)
    vertices, nodes = [(x, y)], [Path.MOVETO]
    n_points, perp_x, perp_y = 12, -np.sin(angle), np.cos(angle)
    for i in range(n_points):
        t = i / (n_points - 1)
        w = width_factor*length*np.sin(np.pi*t)*(1 + asymmetry*np.sin(2*np.pi*t))
        w *= 1 + 0.1*np.random.randn(); mx, my = x + t*(tip_x - x), y + t*(tip_y - y)
        vertices.append((mx + w*perp_x, my + w*perp_y)); nodes.append(Path.LINETO)
    vertices.append((tip_x, tip_y)); nodes.append(Path.LINETO)
    for i in range(n_points - 1, -1, -1):
        t = i / (n_points - 1)
        w = width_factor*length*np.sin(np.pi*t)*(1 + asymmetry*np.sin(2*np.pi*t))
        w *= 1 + 0.1*np.random.randn(); mx, my = x + t*(tip_x - x), y + t*(tip_y - y)
        vertices.append((mx - w*perp_x, my - w*perp_y)); nodes.append(Path.LINETO)
    vertices.append((x, y)); nodes.append(Path.CLOSEPOLY)
    return Path(vertices, nodes), ((x, y), (tip_x, tip_y))

def create_veins(base, tip, n_veins):
    veins = [[(base[0], base[1]), (tip[0], tip[1])]]
    angle = np.arctan2(tip[1] - base[1], tip[0] - base[0])
    for i in range(n_veins):
        t = 0.2 + (0.6*i / (n_veins - 1)); start_x = base[0] + t*(tip[0] - base[0])
        start_y = base[1] + t*(tip[1] - base[1]); side = 1 if i % 2 == 0 else -1
        vein_angle = angle + side*np.pi/4*(1 - t/2); length = 0.3*(1 - abs(t - 0.5))
        veins.append([(start_x, start_y), (start_x + length*np.cos(vein_angle), 
                      start_y + length*np.sin(vein_angle))])
    return veins


palettes = ['forest', 'autumn', 'winter', 'summer', 'sunset']
xs, ys = np.random.uniform(1, 13, 500), np.random.uniform(1, 7, 500)
xs, ys = xs[np.argsort(xs)], ys[np.argsort(xs)]
_, ax = plt.subplots(figsize=(12, 8), facecolor=None); ax.set_facecolor(None)
for x, y in zip(xs, ys):
    palette = palettes[min(int(x // (12 / len(palettes))), len(palettes) - 1)]
    leaf_path, (leaf_base, leaf_tip) = create_leaf((x, y), 0.6+0.2*np.random.rand(),
        2*np.pi*np.random.rand(), 0.3+0.1*np.random.rand(), 0.1+0.1*np.random.rand())
    patch = PathPatch(leaf_path, facecolor=np.random.choice(PALETTE_MAP[palette]),
        edgecolor='none', alpha=0.9, zorder=2)
    ax.add_patch(patch)
    for vein in create_veins(leaf_base, leaf_tip, 6):
        line = ax.plot(*zip(*vein), color='#4A503D', linewidth=0.5, alpha=0.3)[0]
        line.set_clip_path(patch)
ax.set_xlim(0, 14); ax.set_ylim(0, 8); ax.set_aspect('equal'); ax.axis('off')
plt.tight_layout()
plt.show()
```

