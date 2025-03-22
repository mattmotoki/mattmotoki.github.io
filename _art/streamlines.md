---
title: "Perlin Streamlines"
image: "/assets/images/streamlines.png"
tagline: "A smooth, organic pattern created using Perlin noise"
priority: 5
description: ""
---

## Technical Implementation
This code generates a streamline plot using Perlin noise, which creates a smooth, organic pattern. The noise values and their gradients are computed on a grid, and the resulting data is used to draw streamlines with varying colors and transparency.


```r
library(ggplot2)
library(ambient)
library(dplyr)
library(metR)

# set seed and generate Perlin noise
set.seed(0)
n <- 200
perlin_noise <- noise_perlin(c(n, n), frequency=0.001, octaves=3)

# convert the noise matrix
x <- rep(1:n, each=n)
y <- rep(1:n, n)
df <- data.frame(y=y, x=x, noise=as.vector(perlin_noise))

# compute gradients
df$dx <- c(0, diff(df$noise, differences=1))
df$dy <- c(rep(0, n), diff(df$noise, lag=n))
df <- df %>% dplyr::filter(x > 1, x < n, y > 1, y < n)

# plot
ggplot(df, aes(x=x, y=y, dx=dx, dy=dy)) +
    metR::geom_streamline(aes(color=sqrt(..x..^2 + ..y..^2), alpha=0.1*..step..),
                          size=0.5, arrow=NULL, L=1000, res=0.2, n=15) +
    scale_color_gradient(low = "#FF8C00", high = "#FFFF00") +
    theme_void() +
    theme(panel.background = element_rect(fill = "black", colour = "black"),
          plot.background = element_rect(fill = "black", colour = "black"),
          plot.margin = unit(c(0, 0, 0, 0), "cm"),
          legend.position = "none")
```
