## Introduction
Handling streaming data with seasonal or cyclic patterns is a common task in the field of data science and machine learning. In this blog post, we discuss a simple implementation of a Seasonal Uniform Averager that serves as a solid baseline for forecasting problems with cyclical patterns of a known cycle length. We conclude this blog post with a case study from the NeurIPS 2023 CityLearn Challenge, where this method outperformed 75% of the more complex machine learning models.

## Motivation
When dealing with streaming data, the need for a method that can efficiently update the model is important. Online algorithms processes data incrementally, this reduces memory requirements and makes the calculations more efficient. The Seasonal Uniform Averager is an online algorithm that uses an incremental formula to calculate a uniformally weighted average of the data points. 

A key benefit of the Seasonal Uniform Averager is it's simplicity.
* Its simplicity makes it an effective method to address the cold start problem. Many applications face the cold start problem: making predictions with limited data. For instance, an online retailer might want to estimate the likelihood of a new user purchasing a product, but without prior information on the user's preferences, this becomes challenging.
* Its simplicity makes it explainable and easy to modify and improve.
* When evaluating the performance of a model, establishing a quick and reliable baseline is essential. The Seasonal Uniform Averager provides a simple baseline to compare against.


## Implementation
In this section, we will create a simple Python class for the Seasonal Uniform Averager. This class is designed to continually update and maintain a running average for each seasonal index in a cyclic dataset. 

```
class SeasonalUniformAverager:

    def __init__(self, n=24):
        self.n = n
        self.values = np.zeros(n, np.float32)
        self.counts = np.zeros(n, np.int32)
        self.time_index = 0

    def update(self, x):
        seasonal_index = self.time_index % self.n
        self.counts[seasonal_index] += 1
        self.values[seasonal_index] += (x - self.values[seasonal_index]) / self.counts[seasonal_index]
        self.time_index += 1
    
    def predict(self, time_indices):
        return self.values[time_indices % self.n]    
```
The class is set up with a specified cycle length `n` and maintains two arrays: `values` to store the running averages, and `counts` to track the number of updates for each seasonal index. A `time_index` is utilized to keep track of the overall time progression. The `update` method takes a new data point `x` and updates the running average for the current seasonal index, which is determined by `self.time_index % self.n`. This cyclic indexing ensures that the running averages are updated in a seasonal manner, cycling back to the first index after reaching the end of the cycle. The `predict` method returns the current running averages for a provided array of seasonal indices. 

## Mathematical Foundation
We can use mathematical induction to prove that the incremental formula calculates the uniform average. In our implementation, make use of this fact `n` times--one for each seasonal index--however, here will only show it for a single seasonal index. Let $ \bar{x}_k = \frac{1}{k} \sum_{i=1}^k x_i$ represent the average after $ k $ data points. 

### Base Case ($ k = 1 $):
For the first data point, the incremental formula yields: $ \bar{x}_1 = x_1 $. The batch formula also yields: $ \frac{1}{1} \sum_{i=1}^1 x_i = x_1 $. So the formula holds for $ k = 1 $.

### Inductive Step:
Assume the formula holds for some $ k $, i.e., $ \bar{x}_k = \frac{1}{k} \sum_{i=1}^k x_i $ Now, we need to show that the formula also holds for $ k + 1 $.

When the $ (k+1) $-th data point $ x_{k+1} $ arrives, the incremental formula updates the average as follows:

$$ \bar{x}_{k+1} = \bar{x}_k + \left( x_{k+1} - \bar{x}_k \right) / (k + 1) $$

Now, substitute the inductive hypothesis into the equation above:

$$ \bar{x}_{k+1} =  \frac{1}{k} \sum_{i=1}^k x_i + \left( x_{k+1} -  \frac{1}{k} \sum_{i=1}^k x_i  \right) \frac{1}{k+1} $$

Multiply the first term by $ (k + 1) / (k + 1) $ and simplify the expression:
$$ 
\bar{x}_{k+1} 
     = \frac{1}{k+1} \left( \frac{k+1}{k} \sum_{i=1}^k x_i  +  x_{k+1} -  \frac{1}{k} \sum_{i=1}^k x_i \right) 
    = \frac{1}{k+1} \sum_{i=1}^{k+1} x_i
$$

The formula holds for $ k + 1 $ given it holds for $ k $. Thus, by the induction, the incremental formula computes the same uniform average as the batch formula. 


## Improvements

The current implementation can be improved in several ways
* by incorporating a prior value which can be used to bias the average and reduce the variance in the estimate. 
* If your data exibits multiple types of seasonality, then a simple solution combines multiple seasonal uniform averagers to create a single forecast. 
* If the data is non-stationary, then this approach will not work well; a potential improvement is to add a trend to the forecast or to use an exponentially weighted moving average (although the forecast will tend to lag the actual values).  


## Case Study: NeurIPS 2023 CityLearn Challenge
The efficacy of the Seasonal Uniform Averager was put to test in the NeurIPS 2023 CityLearn Challenge. In this challenge, participants were tasked with developing models to forecast energy demand in a simulated urban environment. The cyclical nature of energy demand over the course of a day presented an ideal scenario for employing the Seasonal Uniform Averager.

Remarkably, the straightforward approach of employing a seasonal uniform average outpaced 75% of the more complex machine learning models submitted to the challenge. This not only underscores the effectiveness of the Seasonal Uniform Averager but also highlights the importance of establishing a strong, simple baseline before venturing into more complex modeling techniques.


## Conclusion
The Seasonal Uniform Averager is a is a valuable method for data scientists and machine learning engineers when dealing with seasonal or cyclic data streams with a known cycle length. As demonstrated in the NeurIPS 2023 CityLearn Challenge, a simple, well-thought-out approach can yield results that rival or even surpass those obtained with more complex methodologies. The Seasonal Uniform Averager stands as a strong starting point for anyone looking to delve into the analysis and forecasting of cyclic data.
