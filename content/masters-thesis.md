Title: Master's Thesis
Date: 2018-07-01 22:47
Modified: 2018-07-01 22:47
Category: misc
Tags: Meetup
Slug: masters-thesis
Authors: Matt Motoki
Illustration: adp-for-water-heating.png
Summary: Master's Thesis
Status: published

## [Master's Thesis]({filename}/pdfs/matt-motoki-masters-thesis.pdf)

 My Master’s was on approximate dynamic programming methods for control of a water heater.  The results outperformed the current methodology and the problem framework was well-suited for other derivative applications.  I currently do work as a consultant for a smart water heating company where my Master’s research has been extended to more novel practical problems such as inferring the temperature of the water heater with only measurements of current and flow (not temperature itself). There are other aspects of this problem that can be worked on; e.g., using an RNN to forecast hot water usage, and using a GAN to generate realistic training data which can then be used to train better models. 

* Problem is a simple but has non-trivial Non-Markovian dynamics. 

* Solved a simplified problem and proved that it's solution is at least as good the current state-of-the-art methods.
* Developed an aggregation scheme to handle continuous state-space and showed that it is unbiased and has minimal variance. 
* Approximated a solution to the full problem and showed that the cost achieved was near to the theoretical prescient lower bound.
* Applied optimized water heaters for derivative applications such as load shifting. 



The water heater problem that I worked on during my Master’s thesis had a simple but non-trivial system with non-Markovian dynamics.   The prescient lower bound provides a theoretical lower bound on the minimum total cost of the water heater problem.  This bound can be used to help assess the quality of the solutions to the water heater problem. 


 Formulated the problem of optimizing a water heater as a discrete-time finite-state average cost Markov decision problem.  Used state aggregation and solved the aggregate problem exactly. Proved that the solution to the aggregate problem was no worse than other state-of-the-art methods.  Derived features and solved the problem in feature space using approximate dynamic programming methods.  Showed that performance came close to theoretical optimal provided by the prescient lower bound. 