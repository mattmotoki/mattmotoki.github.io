---
layout: post
title: "Beta Target Encoding"
date: 2025-02-27
image: /assets/images/beta.svg
description: "This post explores Beta Target Encoding, a Bayesian approach to feature engineering for binary classification tasks."
redirect_from:
  - /blog/posts/beta-target-encoding.html
  - /beta-target-encoding.html
---

Bayesian Target Encoding is a feature engineering method that leverages Bayesian principles to convert categorical variables into numeric representations. Beta Target Encoding is a specialized variant designed specifically for binary classification tasks. Beta Target Encoding provides a systematic way to regularize target encoding, reducing overfitting and enabling efficient updates in online learning settings.


## Target Encoding

Most machine learning algorithms require numeric input data. Target encoding is a common technique used to convert categorical variables into numeric variables. When done properly, target encoding can be very effective.

In supervised learning, we are given $N$ data points $(x_i, y_i)$ and tasked with learning a mapping from input variable $x$ to the target variable $y$. Suppose $x$ is categorical and takes on one of $l$ possible (non-numeric) levels $x\in \left\\{ x^{(1)}, x^{(2)}, \dots, x^{(l)} \right\\}$. Standard target encoding maps each level of $x$ into a feature $\phi\in \left\\{ \phi^{(1)}, \phi^{(2)}, \dots, \phi^{(l)} \right\\}$ in the following way:

$$ \phi^{(j)} = \frac{1}{N^{(j)}} \sum_{i=1}^N y_i \cdot \mathrm{I} \left\{ x_i = x^{(j)} \right\} \tag{1} $$

where $N^{(j)} = \sum_{i=1}^N \mathrm{I} \left\\{ x_i = x^{(j)} \right\\}$ and $\mathrm{I}\\{\cdot\\}$ is the indicator function. In other words, $\phi^{(j)}$ is the average $y$-value in level $j$ and $N^{(j)}$ is the total number of observations in level $j$.

### Overfitting and Regularization

Target-encoded variables are inherently leaky; that is, their construction requires information that we will not have when we make predictions. To see why this can be a problem, consider the case when $N^{(j)} = 1$. In this case, the summation in $(1)$ involves only one non-zero term when $x_i = x^{(j)}$. Thus, we have $\phi_i = y_i$; that is, $\phi_i$ is encoded with exactly the value we are trying to predict. Using these target-encoded features as is will lead to overfitting of the training set and poor generalization of our models. This problem is acute when dealing with high cardinality categorical variables. We can combat the data leakage problem by smoothing the estimate of the average $y$-value in level $j$. In particular,

$$ \phi^{(j)} = \lambda^{(j)} \cdot \frac{1}{N} \sum_{i=1}^N y_i + \left( 1 - \lambda^{(j)} \right) \cdot \frac{ 1 }{N^{(j)}} \sum_{i=1}^N y_i \cdot \mathrm{I} \left\{ x_i = x^{(j)} \right\}, \tag{2} $$

which is just a weighted average of the estimate in $(1)$ and the average $y$-value value over the entire training set. The $\lambda^{(j)}$ is a hyperparameter that controls the amount of smoothing in the estimate. Alternatively, we could address data leakage by adding noise to the estimate

$$ \phi^{(j)} = \eta \cdot \epsilon^{(j)} + (1- \eta) \cdot \frac{1}{N^{(j)}} \sum_{i=1}^N y_i \cdot \mathrm{I} \left\{ x_i = x^{(j)} \right\}. \tag{3} $$

The hyperparameters $\lambda^{(j)}$, $\eta$, and the distribution of the random variable $\epsilon^{(j)}$ need to be chosen carefully for target encoding to perform well. By adopting a Bayesian framework, we can handle regularization in a systematic yet intuitive way. Furthermore, the Bayesian framework is well-suited for online learning requiring only minimal updates as new data is acquired. In the next section, we will discuss target encoding in the context of binary classification.

## Bayesian Target Encoding

In Bayesian statistics, we represent our beliefs about the world using a prior distribution. Approaching target encoding from a Bayesian perspective has the following benefits:

- hyperparameters are easy to interpret
- hyperparameter estimation is well-suited for online learning
- generalizing the encoding to statistics other than the mean is easy
- choosing the distribution for the noise random variable is easy

The analysis here considers target encoding for binary classification where the target variable $y$ takes on two discrete values $\\{0,1\\}$. The same line of reasoning applies to target encoding for soft binary classification where $y$ takes on values in the interval $[0, 1]$. The general theory applies to other target variable types.

### The Beta Distribution 

It is convenient to model binary target variables using the Bernoulli distribution, which has the Beta distribution as its conjugate prior, see these <a href="https://people.eecs.berkeley.edu/~jordan/courses/260-spring10/other-readings/chapter9.pdf" target="_blank">course notes</a> on conjugate priors for more details. The Beta distribution is parameterized by $\alpha$ and $\beta$, which can respectively be thought of as the number of positive and negative examples in a repeated Binomial experiment. Many <a href="https://en.wikipedia.org/wiki/Beta_distribution" target="_blank">useful statistics of the Beta distribution</a> can written in terms of $\alpha$ and $\beta$; for example, the mean

$$ \mu = \frac{\alpha}{\alpha + \beta}, \tag{4} $$

the variance

$$ \sigma^2 = \frac{\alpha\beta}{(\alpha + \beta)^2(\alpha + \beta+1)}, \tag{5} $$

and the skewness

$$ \gamma = \frac{2 (\beta - \alpha) \sqrt{\alpha + \beta + 1}}{(\alpha + \beta+1)\sqrt{\alpha\beta}}. \tag{6} $$

### Interpreting the Hyperparameters

When deciding on the prior distribution, we need to set values for $\alpha_{prior}$ and $\beta_{prior}$. One way to do this is with grid search and cross-validation. However, we should not want to search over $\alpha_{prior}$ and $\beta_{prior}$ independently. Instead, we can reduce the search space by requiring $\alpha$ and $\beta$ to be such that the mean of the prior distribution is constant. The obvious choice for prior mean is the average $y$-value in the training set $\mu_{prior} = \frac{1}{N} \sum_{i=1}^N y_i$, but the prior mean can also be set in other ways. If the categorical variables are hierarchical, then the prior mean can come from one step up in the hierarchy. With the mean known, we can reparameterize the beta distribution in terms of $\tau = \alpha_{prior} + \beta_{prior}$. Intuitively, $\tau$ can be thought of the effective sample size from the prior distribution. Rewriting $(4)$ in terms of $\tau$ we get

$$ \alpha_{prior} = \tau \cdot \mu_{prior} \quad\text{and}\quad \beta_{prior} = \tau \cdot(1 - \mu_{prior}). $$

The parameters of the posterior distribution are given by

$$ 
\alpha_{posterior}^{(j)} = \alpha_{prior} + \sum_{i=1}^N y_i \cdot \mathrm{I} \left\{x=x^{(j)}\right\} 
$$

and

$$ 
\beta_{posterior}^{(j)} = \beta_{prior} + N^{(j)} - \sum_{i=1}^N y_i \cdot \mathrm{I} \left\{x=x^{(j)}\right\}.
$$

These equations show the simple update rules for the posterior parameters:
* $\alpha_{posterior}$ is the count of postive examples in the level inflated by $\alpha_{prior}$
* $\beta_{posterior}$ is the count of negative examples in the level inflated by $\beta_{prior}$

To calculate the posterior parameters, all we need to keep track of is the sum of the $y$-values in a level and the total number of observations in that level. When the posterior parameters are known, we can use them to calculate other statistics, such as those in $(4)$, $(5)$, and $(6)$. To see how $\tau$ controls complexity let's rewrite the posterior mean as

$$ \mu_{posterior}^{(j)} = \lambda^{(j)} \cdot \mu_{prior} + \left( 1-\lambda^{(j)} \right) \cdot \frac{1}{N^{(j)}} \sum_{i=1}^N y_i \cdot \mathrm{I} \left\{x=x^{(j)}\right\}, $$

where $\lambda^{(j)} = \tau \,\big/\left( N^{(j)}+\tau \right)$. Notice that this equation has the same functional form as $(2)$. We see that increasing $\tau$ brings the estimate closer to the prior mean and that decreasing $\tau$ brings it closer to the in-level sample average.

Recall that when we use additive noise for regularization $(3)$, we need to specify the distribution of the noise random variable $\epsilon^{(j)}$. This is natural to do when taking the Bayesian approach. In particular, we can set the noise to be $\epsilon^{(j)} \sim \mathrm{Beta}\big(\alpha_{posterior}^{(j)},\, \beta_{posterior}^{(j)} \big)$. The only hyperparameter left to tune is the noise strength $\eta$. Notice that from $(5)$, the variance of the noise distribution will shrink as we obtain more observations. What this means is that as the number of observations increases, the noise distribution will converge to a delta function centered at $\mu_{posterior}^{(j)}$. Thus, we have the nice property that the amount of regularization decreases as the number of observations increases.

## Conclusion
The Bayesian target encoding framework is highly flexible and extends beyond binary classification. For instance, the Beta distribution can be replaced with the Dirichlet distribution for categorical targets or the Normal distribution for regression tasks. Additionally, it can be adapted for hierarchical encoding, where prior means are set based on higher-level group statistics. For example, in location-based modeling, the target mean for counties could be regularized toward the state-level average, improving robustness for low-data regions.

The Bayesian perspective provides a principled way to balance prior knowledge with observed data, naturally preventing overfitting while enabling online learning. Unlike heuristic-based smoothing methods, Bayesian Target Encoding provides interpretable hyperparameters and a probabilistic framework for encoding categorical features. This makes it a powerful tool for feature engineering in modern machine learning pipelines.

