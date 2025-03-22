---
title: "Fractal Tree"
image: "/assets/images/fractal-tree.png"
tagline: "An autumnal, branching fractal tree with recursive patterns."
priority: 9
description: ""
visible: false
---

## Technical Implementation
This creative coding project generates a fractal tree with autumn-inspired colors. The algorithm uses recursive branching patterns to create a natural-looking tree structure, with each branch splitting into smaller branches at varying angles.

```r
library(ggplot2)

tree_data <- data.frame(
    x1=numeric(),
    y1=numeric(),
    x2=numeric(),
    y2=numeric(),
    d=numeric(),
    col=numeric()
)

draw_tree <- function(x1, y1, θ, d, L, depth) {
    if (d == 0) return()
    
    Δθ <- runif(1, -pi/12, pi/12)
    ΔL <- runif(1, 0.8, 1.2)
    
    x2 <- x1 + cos(θ + Δθ) * L * ΔL
    y2 <- y1 + sin(θ + Δθ) * L * ΔL
    
    df <- data.frame(x1=x1, y1=y1, x2=x2, y2=y2, d=d, col=depth)
    tree_data <<- rbind(tree_data, df)
    
    draw_tree(x2, y2, θ - pi/6, d-1, L*0.7, depth+1)
    draw_tree(x2, y2, θ + pi/6, d-1, L*0.7, depth+1)
}

set.seed(0)
max_depth <- 10
draw_tree(0, 0, pi/2, max_depth, 0.3, 1)

color_palette <- scales::manual_pal(values = c(
    colorRampPalette(c("#8B4513", "#D8A606"))(3), # trunk
    colorRampPalette(c("#FFD700", "#B22222"))(7)  # leaves
))(10)

ggplot() +
    geom_segment(
        data=tree_data,
        aes(x=x1, y=y1, xend=x2, yend=y2, color=factor(col)),
        size=1.5,
        lineend="round"
    ) +
    scale_color_manual(values=color_palette) +
    theme_void() +
    coord_fixed(ratio=1) +
    theme(legend.position="none")
```
