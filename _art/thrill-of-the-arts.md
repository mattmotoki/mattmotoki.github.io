---
title: "Thrill of the Arts"
image: "/assets/images/thrill-of-the-arts2.svg"
display_image: "/assets/images/thrill-of-the-arts2-wide.svg"
tagline: "Inspired by Vulfpeck"
priority: 1.0
description: ""
---




## Technical Implementation
I like minimalist geometric art and was inspired by [Vulfpeck's Thrill of the Arts album art](https://vulfpeck.bandcamp.com/album/thrill-of-the-arts). The idea is simple, basically lines with an increasing vertical offset at around 75% between the endpoints.


```python
import numpy as np
import matplotlib.pyplot as plt

x_base = np.array([0, 7.5, 10])
y_base = np.array([1, 1.3, 1])

plt.figure(figsize=(10,5))
for i in range(2):
    for j in range(30):
        x = x_base - 6*i
        y = y_base*j + 6*i
        c = plt.cm.winter(j/29)[:-1]
        plt.plot(x, y, color=(c, 1-0.5*i), linewidth=3)
plt.axis('off')
plt.show()
```
