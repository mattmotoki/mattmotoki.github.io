Title: Kaggle Competition Archive
Date: 2018-07-03 01:40
Modified: 2018-07-03 01:40
Category: misc
Tags: Kaggle, Natural Language Processing, Computer Vision
Slug: kaggle-archive
Authors: Matt Motoki
Illustration: bg0.png
Summary: Summary of Methods Used In Kaggle Competitions
Status: published




<h1 id="toc">Table Of Contents</h1>

This is an archive of Kaggle competitions that I have done. 


[**Regression**](#regression)

* [Avito Demand Prediction Challenge](#avito-demand-prediction-challenge) 
* [Corporación Favorita Grocery Sales Forecasting](#corporación-favorita-grocery-sales-forecasting) 
* [Grupo Bimbo Inventory Demand](#grupo-bimbo-inventory-demand) 


[**Binary Classification**](#binary-classification)

* [Santander Customer Satisfaction](#santander-customer-satisfaction) 
* [Porto Seguro’s Safe Driver Prediction](#porto-seguros-safe-driver-prediction) 
* [Quora Question Pairs](#quora-question-pairs) 
* [TalkingData AdTracking Fraud Detection Challenge](#talkingData-adtracking-fraud-detection-challenge) 


[**Multiclass & Multilabel Classification**](#multiclass-multilabel-classification)

* [Toxic Comment Classification Challenge](#toxic-comment-classification-challenge) 
* [Instacart Market Basket Analysis](#instacart-market-basket-analysis) 
* [Facebook V: Predicting Check Ins](#facebook-v-predicting-check-ins) 
* [Cdiscount’s Image Classification Challenge](#cdiscounts-image-classification-challenge) 



[**Optimization**](#optimization)

* [Santa's Uncertain Bags](#santas-uncertain-bags) 
* [Santa Gift Matching Challenge](#santa-gift-matching-challenge) 


[**Image Segmentation**](#image-segmentation)

* [Carvana Image Masking Challenge](#carvana-image-masking-challenge) 


<br>
<hr>
<h1 id="regression">Regression</h1> 


<h2 id=avito-demand-prediction-challenge>Avito Demand Prediction Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 14/1917 (top 0.7%)
* **Date Completed**:  June 27, 2018
* **Competition Host**: Avitio
* **Links:** 
[Competition Website](https://www.kaggle.com/c/avito-demand-prediction),
[Discussion Post](https://www.kaggle.com/c/avito-demand-prediction/discussion/60059),
[Blog Post](https://mattmotoki.github.io/beta-target-encoding.html)

Joined a team of data scientists to predict demand for an online advertisement based on its full description (title, description, images, etc.), its context (geographically where it was posted, similar ads already posted), and historical demand for similar ads in similar contexts. The competition metric was the root mean squared error between our prediction and the probability of a deal.  My main contribution to my team's solution was a feature encoding technique called Beta Target Encoding.  The beta target encoded features outperformed the built-in LightGBM categorical encoding.  Our final submission which ranked in the top 0.7% consisted of a large ensemble of gradient boosted decision trees and neural networks. 



<h2 id=corporación-favorita-grocery-sales-forecasting>Corporación Favorita Grocery Sales Forecasting <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 76/1675 (top 4.5%)
* **Date Completed**:  January 15, 2018
* **Competition Host**: Corporación Favorita
* **Links:** 
[Competition Website](https://www.kaggle.com/c/favorita-grocery-sales-forecasting)

Created grocery sales forecast for a 16day horizon.  Feature engineering was an important part of the final solution; features included lagged sales aggregated over multiple windows.   Features were fed into LightGBM for fast training and prediction.  Models were evaluated using the Normalized Weighted Root Mean Squared Logarithmic Error.  My final submission ranked in the top 4.5%.  

 

 <h2 id=grupo-bimbo-inventory-demand>Grupo Bimbo Inventory Demand <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 231/1969 (top 11.7%)
* **Date Completed**:  August 30, 2016
* **Competition Host**: Grupo Bimbo
* **Links:** 
[Competition Website](https://www.kaggle.com/c/grupo-bimbo-inventory-demand)


Partnered with a Hawaii-based data scientist to provide a two-week ahead forecast for client-product sales of the multinational company Grupo Bimbo. The metric used in this competition was the log RMSE and the data for the competition consisted of nearly one million clients each with a few thousand products to order. Our feature engineering consisted of mapping high cardinality categorical variables into a more readily usable form. The final submission ranked in the top 11.7%. 



<br>
<hr>
<h1 id="binary-classification">Binary Classification</h1> 

<h2 id=santander-customer-satisfaction>Santander Customer Satisfaction <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 8/5123 (top 0.2%)
* **Date Completed**:  May 2, 2016
* **Competition Host**: Santander
* **Links:** 
[Competition Website](https://www.kaggle.com/c/santander-customer-satisfaction)

Predicted customer satisfaction for the multinational bank Santander.  The formal objective was to minimize the area under the receiver operator curve of the probability that a customer is dissatisfied with service.   Customized feature engineering appealed to statistical patterns in the anonymized data to create robust low-dimensional features.  These features helped to both increase accuracy and decrease variance in the model predictions.  The final model ranked in the top 0.2% and consisted of an ensemble of three XGBoost models trained with different feature groupings and a stacked Extra Trees model.   


<h2 id=porto-seguros-safe-driver-prediction>Porto Seguro’s Safe Driver Prediction <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 58/5169 (top 1.1%)
* **Date Completed**:  November 29, 2017 
* **Competition Host**: Porto Seguro
* **Links:** 
[Competition Website](https://www.kaggle.com/c/porto-seguro-safe-driver-prediction)

Used robust modeling techniques to predict the probability of an insurance claim from noisy anonymized data.  Multiple implementations of gradient boosted decision tree libraries (including XGBoost, CatBoost, and LightGBM) were blended to reduce the variance in predictions.  The evaluation metric was the Normalized Gini Coefficient.  My final submission ranked in the top 1.1%.  


<h2 id=quora-question-pairs>Quora Question Pairs <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 95/3307 (top 2.9%)
* **Date Completed**:  June 6, 2017 
* **Competition Host**: Quora
* **Links:** 
[Competition Website](https://www.kaggle.com/c/quora-question-pairs)

Partnered with a Hawaii-based data scientist to apply natural language processing (NLP) techniques to detect duplicate questions for the crowdsourcing question and answer company Quora. The metric used in this competition was the log loss and the data for the competition consisted of 300,000+ question pairs.  We constructed sentence features from variants of TF-IDF weightings, part-of-speech tags, and string and word distances.  We created ensembles of recurrent neural networks (in particular LSTM) trained on learned and precomputed word embeddings.  We ranked in the top 2.9% using a blend of gradient boosted decision trees and recurrent neural networks. 



<h2 id=talkingData-adtracking-fraud-detection-challenge>TalkingData AdTracking Fraud Detection Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 119/3967 (top 3.0%)
* **Date Completed**:  May 7, 2018
* **Competition Host**: TalkingData
* **Links:** 
[Competition Website](https://www.kaggle.com/c/talkingdata-adtracking-fraud-detection)

Partnered with a team of data scientists to predict the probability that an ad is fraudulent or not. The competition metric was the 
area under the receiver operator curve.  The data consisted of categorical variables such as the device type, app id, os id, and the timestamp of the click.  Our feature engineering consisted of target encoding the categorical variables and their interactions.  Our team relied on factorization machines, neural networks, and gradient boosted decision trees to finish in the top 3.0%. 


<br>
<hr>
<h1 id="multiclass-multilabel-classification">Multiclass & Multilabel Classification</h1> 


<h2 id=toxic-comment-classification-challenge>Toxic Comment Classification Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 33/4551 (top 0.7%)
* **Date Completed**:  March 20, 2018
* **Competition Host**: Jigsaw
* **Links:** 
[Competition Website](https://www.kaggle.com/c/jigsaw-toxic-comment-classification-challenge), 
[Discussion Post](https://www.kaggle.com/c/jigsaw-toxic-comment-classification-challenge/discussion/52666),
[Code](https://github.com/mattmotoki/toxic-comment-classification)

Optimized various recurrent and 1-D convolutional neural networks to categorize the sentiment of online comments.  Designed a fast similarity embedding imputation to address out-of-vocabulary (OOV) words.  The imputation method produced results that were on par with the current state-of-the-art method for filling in OOV words; however, the imputation method is more widely applicable.  My final solution ranked in the top 0.7%. 


<h2 id=instacart-market-basket-analysis>Instacart Market Basket Analysis <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 29/2623 (top 1.1%)
* **Date Completed**:  August 14, 2017 
* **Competition Host**: Instacart
* **Links:** 
[Competition Website](https://www.kaggle.com/c/instacart-market-basket-analysis),
[Markov Chain Tutorial](https://www.kaggle.com/mmotoki/markov-chain-tutorial)

Applied forecasting techniques to predict customer reorders for grocery delivery company Instacart. The metric used in this competition was the mean F1 score and the data for the competition consisted of order histories of 300,000+ members for 50,000+ products.  Features were derived from Markov Chains and ARIMA models.  A customized post-processing routine optimized predictions for the F1 metric.  The final model ranked in the top 1.1%. 


<h2 id=facebook-v-predicting-check-ins>Facebook V: Predicting Check Ins <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 85/1212 (top 7.0%)
* **Date Completed**:  July 6, 2016
* **Competition Host**: Facebook
* **Links:** 
[Competition Website](https://www.kaggle.com/c/facebook-v-predicting-check-ins)

Predicted the check-in location of a person from noisy simulated Facebook data.  The objective was to minimize the mean average precision between the top 3 predicted check-in locations and the actual check-in location.  The data was particularly interesting in that it contained relatively few explanatory variables (5) and over 100,000 check-in locations to predict.  My approach was to subset the data using overlapping grids, train models on the subsets, and then combine the models' predictions using a spatial weighting system.  The final result ranked in the top 7.0%. 



<h2 id=cdiscounts-image-classification-challenge>Cdiscount’s Image Classification Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 52/627 (top 8.3%)
* **Date Completed**:  December 14, 2017 
* **Competition Host**: Cdiscount
* **Links:** 
[Competition Website](https://www.kaggle.com/c/cdiscount-image-classification-challenge)

Fine-tuned many of the current state-of-the-art neural network architectures to predict the category of online products.  The dataset was very large: 

* Almost 9 million products  
* More than 15 million images at 180x180 resolution 
* More than 5000 categories 
* Over 62 GB of BSON files (binary JSON) 

My final solution, which was an ensemble of various DenseNet, Resnet, Inception, and Xception architectures, ranked in the top 3.8%




<br>
<hr>
<h1 id="optimization">Optimization</h1> 


<h2 id=santas-uncertain-bags>Santa's Uncertain Bags <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 65/694 (top 9.4%)
* **Date Completed**:  January 30, 2017
* **Competition Host**: Kaggle
* **Links:** 
[Competition Website](https://www.kaggle.com/c/santas-uncertain-bags)
[Kernel](https://www.kaggle.com/mmotoki/from-little-bags-of-joy-to-big-bags-of-toys)


Teamed up with friends to solve a stochastic optimization problem.  The problem setup was as follows: 

* Santa has 1000 bags to fill to fill with 9 types of gifts.  
* Each gift had an unknown weight drawn from a given probability distribution.  
* Each bag has a capacity of 50 pounds.  
* The score was equal to the total weight of the gifts not included in overloaded bags. 

The problem could be framed as a variant of the multiple knapsack problem by assuming each gift had a weight equal to its expected value. We devised a technique to glean more information about the weights of the gifts.  The technique consisted of probing the leaderboard and calculating conditional probabilities based on the feedback (we contacted Kaggle and determined that this was within the rules).  Our final submission ranked in the op 9.4%. 
 


<h2 id=santa-gift-matching-challenge>Santa Gift Matching Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 88/428 (top 20.6%)
* **Date Completed**:  January 12, 2018
* **Competition Host**: Kaggle
* **Links:** 
[Competition Website](https://www.kaggle.com/c/santa-gift-matching)

Teamed up with a Kaggle Grandmaster to find a near optimal solution to a large-scale nonlinear optimization problem.  The task was to assign gifts to children.  Each assignment has a gift happiness and child happiness.  The objective was to maximize the cube of the total gift happiness plus the cube of the total child happiness. The constraints of the problem were essentially linear.   The objective function—while nonlinear—is well modeled by a linear approximation.  The linearized problem was framed as a max-flow min-cost problem and solved exactly using Google’s OR-Tools.   The solution was then fine-tuned using a greedy heuristic implemented in plain C for speed. Our final submission ranked in the top 20.6%. 

 


<br>
<hr>
<h1 id="image-segmentation">Image Segmentation</h1> 


<h2 id=carvana-image-masking-challenge>Carvana Image Masking Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 72/735 (top 9.8%)
* **Date Completed**:  September 27, 2017 
* **Competition Host**: Carvana
* **Links:** 
[Competition Website](https://www.kaggle.com/c/carvana-image-masking-challenge)

Used deep learning to create high-quality image masks for the online car dealership company Carvana. The metric used in this competition was the dice coefficient and the data for the competition consisted of 5,000+ high resolution images of showroom car.  A very deep neural network architecture called U-Net quickly achieved greater than 99.5% accuracy.  My final submission of an ensemble of U-Nets ranked in the top 9.8%. 

