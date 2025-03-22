---
title: "Perspective"
image: "/assets/images/faces.png"
description: ""
---

## Technical Implementation
This creative coding project explores perspective transformations in 3D space. The visualization demonstrates how 2D planes appear when viewed from different angles in a 3D environment, creating an illusion of depth and dimension. The project helps illustrate fundamental concepts of computer graphics and spatial geometry through an interactive visual experience.

```r
library(rgl)

# vertices
vertices <- matrix(c(
    0,0,0, 1,0,0, 1,1,0, 0,1,0,
    0,0,1, 1,0,1, 1,1,1, 0,1,1),
    byrow=TRUE, ncol=3
)

# edges
edges <- matrix(c(
    1,2, 2,3, 3,4, 4,1,  # bottom face
    5,6, 6,7, 7,8, 8,5,  # top face
    1,5, 2,6, 3,7, 4,8), # vertical edges
    byrow=TRUE, ncol=2
)

# draw
n <- 2
open3d(silent=TRUE)
for (x in seq(0, 1, length.out=n+1)) {
    for (y in seq(0, 1, length.out=n+1)) {
        lines3d(c(x, x), c(0, 1), c(y, y))
        lines3d(c(0, 1), c(x, x), c(y, y))
        lines3d(c(y, y), c(x, x), c(0, 1))
    }
}

# view (it's interactive)
view3d(theta=45, phi=45, fov=30)
rglwidget()
```

