Title: Bayesian Target Encoding
Date: 2017-11-26 10:01
Modified: 2017-11-28 12:30
Category: misc
Tags: Feature Engineering, Bayesian Statistics
Slug: bayesian-target-encoding
Authors: Matt Motoki
Illustration: tcobd.png
Summary: Bayesian target encoding is feature engineering technique used to encode categorical variables for supervised learning. 


# Summary 
This blog provides a mathematical framework for the common technique for encoding categorical variables called target encoding.  The method relies on Bayesian statistics and is well-suited for online learning.  Code for implementing the Bayesian target encoding is provided and applied to the recent Avito Kaggle Competition where my team and I took 14th place. 



# Background
Target encoding is a common technique for encoding a categorical variable. The idea is to capture the relationship between the levels of categorical variable and the target variable by calculating statistics for each level.  The most commonlu used statistic is the mean, in which case it is called mean target encoding.  Catboost and LightGBM offer built-in mean targt encoding. 

The main drawback of target encoding is that it leaks information about the variable we are trying to predict.  If we have levels with only a few observations then we risk overfitting our data which leads to poor generalization of our models.  This problem is acute when dealing with high cardinality categorical variables.  Regularization either by smoothing estimates or adding noise to the data is the common approach to dealing with overfitting.  By adopting a Bayesian framework, we can handle regularization in a systematic yet intuitive way.  Furthermore, the Bayesian framework is well-suited for online learning requiring only minimal updates as new data is aquired. 

In what follows I will discuss Bayesian target encoding in the context of binary classification.  However, the framework can be adapted to other target distributions. 


# Theory

The beta distribution is parameterized by $\alpha$ and $\beta$ which can respectively be thought of as the number of positive and negative examples in a repeated Bernoulli experiment.  We do not want to search over $\alpha$ independently $\beta$.  Instead, we would prefer to search over $\alpha$ and $\beta$ such that the mean of the distribution is constant
$$
\mu_{prior} = \frac{\alpha}{\alpha + \beta}. 
$$

If we may have intuition about the prior mean (e.g,. in the case of hierarchical Bayesian target encoding) or we may not.  In the latter case we can simply calculate the mean over the entire training set (we leak target information by doing this but the risk of overfitting is minimal).  With the mean known, we can reparamertize the beta distribution in term of $\tau = \alpha + \beta$.  Intuitvely, $tau$ can be thought of the effective sample size from the prior distribution.  Rewriting the above equation we get
$$
\alpha = \tau \cdot \mu_{prior}  \quad\text{and}\quad \beta = \tau \cdot(1 - \mu_{prior}).
$$

From [Eq. (9.20)](https://people.eecs.berkeley.edu/~jordan/courses/260-spring10/other-readings/chapter9.pdf), the posterior mean can be calculated as a weighted average of the prior mean with the MLE 
$$
\mu_{posterior} = \kappa \cdot \mu_{prior} + (1-\kappa) \cdot \frac{n}{N}, 
$$
where $n$ is the total number of positive examples, $N$ is the total number of examples, and the weight $\kappa$ is 
$$
\kappa = \frac{\tau}{N+\tau}.
$$
We see that increasing $tau$ makes $kappa$ closer to 1 and thus the posterior mean becomes closer to the prior mean.  Hence, $\tau$ is a regularization hyperparameter that we can tune to control the complexity of our target encoded variable.  Another way to write the posterior mean is
$$
\mu_{posterior} = \frac{\tau \cdot \mu_{prior} + n}{N + \tau}.
$$

This equation shows the simple update rule for the posterior mean; all we need to keep track of the counts of 1's and 0's.  

Note that the parameters of the posterior distribution are 
$$
\alpha_{posterior} = \tau \cdot \mu_{prior} + n \quad\text{and}\quad \beta_{posterior} = N-n + \tau \cdot (1 - \mu_{prior}).
$$
Since the posterior parameters are known we can use them to calculate other statistics; e.g., 

$$
\mathrm{var} = \frac{\alpha\beta}{(\alpha + \beta)^2(\alpha + \beta+1)}
$$
and
$$
\mathrm{skewness} = \frac{2 (\beta - \alpha) \sqrt{\alpha + \beta + 1}}{(\alpha + \beta+1)\sqrt{\alpha\beta}}.
$$

Furthermore, we can add noise to the target encoded variables by sampling from the posterior or prior distribution.  For example, fix the noise strength $\epsilon$ we can add noise using the following formula
$$
\tilde{\mu}_{posterior} = (1-\epsilon)\cdot \mu_{posterior} + \epsilon\cdot X_{posterior}
$$
where $X_{posterior} \sim \mathrm{Beta}(\alpha_{posterior}, \beta_{posterior})$. 









#  Examples