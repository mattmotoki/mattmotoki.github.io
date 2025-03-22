---
title: "Fruity"
image: "/assets/images/fruity-thumbnail.svg"
display_image: "/assets/images/fruity.svg"
tagline: "A colorful maze-like pattern with fruit-inspired shapes"
priority: 9
description: ""
visible: false
---

## Technical Implementation
The algorithm iteratively places circles, each representing a fruit. It randomly selects a fruit type and position, then calculates the overlap with existing circles. A new circle is accepted based on a probability that decreases with increasing overlap.

```python
import numpy as np
import matplotlib.pyplot as plt


FRUITS = [
    {"name": "Strawberry", "color": "#FFA8A8", "size": (0.5, 0.7), "prob": 0.2},
    {"name": "Lemon",      "color": "#FFCC54", "size": (0.8, 1.0), "prob": 0.4},
    {"name": "Lime",       "color": "#8ADC9C", "size": (0.7, 0.9), "prob": 0.4},
    {"name": "Orange",     "color": "#FFA163", "size": (1.3, 1.5), "prob": 0.1},
    {"name": "Grape",      "color": "#B57DDB", "size": (0.3, 0.5), "prob": 0.3},
    {"name": "Blueberry",  "color": "#5C8AA8", "size": (0.2, 0.4), "prob": 0.3}
]

total_prob = sum(fruit["prob"] for fruit in FRUITS)
for fruit in FRUITS:
    fruit["prob"] /= total_prob

def create_circle():
    x, y = np.random.uniform(0, 10, 2)
    fruit = np.random.choice(FRUITS, p=[f["prob"] for f in FRUITS])
    r = np.random.uniform(*fruit["size"])
    return (x, y, r, fruit["color"])

def circle_overlap_area(circle1, circle2):
    x1, y1, r1, _ = circle1
    x2, y2, r2, _ = circle2
    d = np.sqrt((x1 - x2)**2 + (y1 - y2)**2)
    
    if d >= r1 + r2: return 0
    if d <= abs(r1 - r2): return np.pi * min(r1, r2)**2
    
    a, b = r1**2, r2**2
    x = (a - b + d**2) / (2*d)
    z = max(0, min(r1, x))
    y = np.sqrt(abs(a - z**2))
    
    return a * np.arcsin(y/r1) + b*np.arcsin(y/r2) - y*(z + np.sqrt(abs(b - z**2)))


np.random.seed(0)
fig, ax = plt.subplots(figsize=(10, 10))
circles = []
for _ in range(150):
    x, y, r, color = new_circle = create_circle()
    total_overlap = sum(circle_overlap_area(new_circle, c) for c in circles)
    if np.random.random() < max(0, 1 - (2*total_overlap/r**2)):
        ax.add_artist(plt.Circle((x, y), r, color=color, alpha=0.5, linewidth=25*r))
        circles.append(new_circle)
ax.set_xlim(0, 10)
ax.set_ylim(0, 10)
ax.axis("off")
plt.show()

```


