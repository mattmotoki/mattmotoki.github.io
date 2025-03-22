---
title: "Sprinkled Silhouette"
image: "/assets/images/silhouette.png"
tagline: "A landscape-like silhouette against a colorful gradient sky"
priority: 3
description: ""
---


## Technical Implementation
The code combines Perlin noise to create a mountain-like silhouette and a color gradient using the viridis palette. The points are created within a grid system with their color determined by position. The silhouette is formed by calculating the intersection of polygons.

```r
library(ggplot2)
library(ambient)
library(viridis)
library(sp)

# grid
set.seed(0)
y <- rep(seq(-1,  10, length.out=15), 15)
x <- rep(seq(-10, 10, length.out=15), each=15)
color <- cos(atan2(y, x) + sqrt(x^2 + y^2)/10)
df <- data.frame(x=x, y=y, c=color)

# silhouette
xs <- seq(-11, 11, length.out=10000)
noise <- noise_perlin(c(10000, 1), frequency=2e-04) 
dfs <- data.frame(x=xs, y=30*abs(noise)-1.1)

# intersect
mask <- point.in.polygon(df$x, df$y, dfs$x, dfs$y)
df <- df[mask == 0, ]

# plot
ggplot() +
    geom_point(data=df, aes(x=x, y=y, color=c, size=10)) +
    scale_color_gradientn(colors=turbo(10, 1, 0.1, 1)) +
    theme_void() + theme(legend.position="none")
```