---
title: "Shell"
image: "/assets/images/shell-thumbnail.svg"
display_image: "/assets/images/shell.svg"
tagline: "A spiral pattern resembling a nautilus shell."
description: ""
---

This was my first creative coding experiment. It's a simple connect-the-dots program that generates a spiral pattern resembling a shell. The visualization is based on the logarithmic spiral, a pattern that appears frequently in natural structures like shells, hurricanes, and galaxies.

## Technical Implementation

The visualization is based on the [logarithmic spiral](https://en.wikipedia.org/wiki/Logarithmic_spiral). The equation for the logarithmic spiral is:

$$ r = a e^{k\theta} $$

where $r$ is the distance from the origin, $\theta$ is the angle from the positive x-axis, $a$ is the starting radius, and $k$ is the growth factor. In this case, I used $a = 1$ and $k = 0.3$.



```r
n <- 20
t <- seq(-pi, pi, length=n)
r <- exp(0.3*t); x <- r*cos(t); y <- r*sin(t)

plot(x, y, type='n', asp=1, axes=F, xlab='', ylab='') 
for (i in 1:n) for (j in 1:n) {
    xij <- x[c(i, j)]; yij <- y[c(i, j)]
    lines(xij, yij, lwd=2, col='#FF00FF40')
}
```

