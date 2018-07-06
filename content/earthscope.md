Title: EarthScope
Date: 2018-07-01 22:47
Modified: 2018-07-01 22:47
Category: misc
Tags: Remote Sensing, Computer Visions, U-Net, Machine Learning
Slug: earthscope
Authors: Matt Motoki
Illustration: earthscope-bg.jpg
Summary: EarthScope
Status: 

## EarthScope

From January 2017 - March 2017, I worked with a good friend Sam Murphy on his StartUp called [EarthScope](https://earthscope.io/preview.html).  EarthScope aims to monitor the world's wildfires.  Sam's PhD is in remote sensing and his postdoctoral research was funded by Google Earth Engine. During this time I helped him train a neural network with the U-Net architecture on his dataset of over 32 GB of satellite imagery.  We used batch renormalization to deal small batch sizes.  Data augmentation consisted of random crops, rotations, and horizontal flip.  Our neural network produced state-of-the-art detection accuracy.  





## Implementation


Batch normalization is a technique that is used to 





![alt text](./images/u-net-architecture.png "U-Net Architecture")


## References

* [Batch Renormalization: Towards Reducing Minibatch Dependence in Batch-Normalized Models](https://arxiv.org/abs/1702.03275)
* [Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift](https://arxiv.org/abs/1502.03167)
* [Code](no code yet)


<!-- Wildfires are a big problem.  Using a new constellation of satellites we will have more frequent access to data and will be able to detect fires faster than ever before.  -->



