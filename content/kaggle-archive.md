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


* [Santander Customer Satisfaction](#santander-customer-satisfaction) 
* [Toxic Comment Classification Challenge](#toxic-comment-classification-challenge) 
* [Instacart Market Basket Analysis](#instacart-market-basket-analysis) 
* [Porto Seguro’s Safe Driver Prediction](#porto-seguros-safe-driver-prediction) 
* [Quora Question Pairs](#quora-question-pairs) 
* [Corporación Favorita Grocery Sales Forecasting](#corporación-favorita-grocery-sales-forecasting) 
* [Facebook V: Predicting Check Ins](#facebook-v-predicting-check-ins) 
* [Cdiscount’s Image Classification Challenge](#cdiscounts-image-classification-challenge) 
* [Carvana Image Masking Challenge](#carvana-image-masking-challenge) 
* [Grupo Bimbo Inventory Demand](#grupo-bimbo-inventory-demand) 
* [Santa Gift Matching Challenge](#santa-gift-matching-challenge) 







<h2 id=santander-customer-satisfaction>Santander Customer Satisfaction <b><a href="#toc">&#8593;</a></b></h2>  


* **Private Leaderboard Rank**: 8/5123 (top 0.2%)
* **Date Completed**:  May 2, 2016
* **Competition Host**: Santander
* **Links:** 
[Competition Website](https://www.kaggle.com/c/santander-customer-satisfaction)

Predicted customer satisfaction for the multinational bank Santander.  The formal objective was to minimize the AUROC (area under the receiver operator curve) of the probability that a customer is dissatisfied with service.   Customized feature engineering appealed to statistical patterns in the anonymized data to create robust low-dimensional features.  These features helped to both increase accuracy and decrease variance in the model predictions.  The final model ranked in the top 0.2% and consisted of an ensemble of three xgboost models trained with different feature groupings and a stacked Extra Trees model.   




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




<h2 id=porto-seguros-safe-driver-prediction>Porto Seguro’s Safe Driver Prediction <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 58/5169 (top 1.1%)
* **Date Completed**:  November 29, 2017 
* **Competition Host**: Porto Seguro
* **Links:** 
[Competition Website](https://www.kaggle.com/c/porto-seguro-safe-driver-prediction)

Used robust modeling techniques to predict the probability of an insurance claim from noisy anonymized data.  Multiple implementations of gradient boosted decision tree libraries (including Xgboost, Catboost, and LightGBM) were blended to reduce the variance in predictions.  The evaluation metric was the Normalized Gini Coefficient.  My final submission ranked in the top 1.1%.  




<h2 id=quora-question-pairs>Quora Question Pairs <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 95/3307 (top 2.9%)
* **Date Completed**:  June 6, 2017 
* **Competition Host**: Quora
* **Links:** 
[Competition Website](https://www.kaggle.com/c/quora-question-pairs)

Partnered with a local data scientist to apply natural language processing (NLP) techniques to detect duplicate questions for the crowdsourcing question and answer company Quora. The metric used in this competition was the log loss and the data for the competition consisted of 300,000+ question pairs.  We constructed sentence features from variants of TF-IDF weightings, part-of-speech tags and string and word distances.  We created ensembles of recurrent neural networks (in particular LSTM) trained on learned and precomputed word embeddings.  We ranked in the top 2.9% using a blend of gradient boosted decision trees and recurrent neural networks. 




<h2 id=corporación-favorita-grocery-sales-forecasting>Corporación Favorita Grocery Sales Forecasting <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 76/1675 (top 4.5%)
* **Date Completed**:  January 15, 2018
* **Competition Host**: Corporación Favorita
* **Links:** 
[Competition Website](https://www.kaggle.com/c/favorita-grocery-sales-forecasting)

Created grocery sales forecast for a 16day horizon.  Feature engineering was an important part the final solution; features included lagged sales aggregated over multiple windows.   Features were fed into LightGBM for fast training and prediction.  Models were evaluated using the Normalized Weighted Root Mean Squared Logarithmic Error.  My final submission ranked in the top 4.5%.  

 


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
* Over 62 GB of bson files (binary json) 

My final solution which was an ensemble of various DenseNet, Resnet, Inception, and Xception architectures ranked in the top 3.8%.  




<h2 id=carvana-image-masking-challenge>Carvana Image Masking Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 72/735 (top 9.8%)
* **Date Completed**:  September 27, 2017 
* **Competition Host**: Carvana
* **Links:** 
[Competition Website](https://www.kaggle.com/c/carvana-image-masking-challenge)

Used deep learning to create high-quality image masks for the online car dealership company Carvana. The metric used in this competition was the dice coefficient and the data for the competition consisted of 5,000+ high resolution images of showroom car.  A very deep neural network architecture called U-Net quickly achieved greater than 99.5% accuracy.  My final submission of an ensemble of U-Nets ranked in the top 9.8%. 


 

 <h2 id=grupo-bimbo-inventory-demand>Grupo Bimbo Inventory Demand <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 231/1969 (top 11.7%)
* **Date Completed**:  August 30, 2016
* **Competition Host**: Grupo Bimbo
* **Links:** 
[Competition Website](https://www.kaggle.com/c/grupo-bimbo-inventory-demand)


Partnered with a local data analyst to provide a two week ahead forecast for client-product sales of the multinational company Grupo Bimbo. The metric used in this competition was the log RMSE and the data for the competition consisted of nearly one million clients each with a few thousand products to order. Our feature engineering consisted of mapping high cardinality categorical variables into a more readily usable form. The final submission ranked in the top 11.7%. 




<h2 id=santa-gift-matching-challenge>Santa Gift Matching Challenge <b><a href="#toc">&#8593;</a></b></h2>  

* **Private Leaderboard Rank**: 88/428 (top 20.6%)
* **Date Completed**:  January 12, 2018
* **Competition Host**: Kaggle
* **Links:** 
[Competition Website](https://www.kaggle.com/c/santa-gift-matching)

Teamed up with a Kaggle Grandmaster to find a near optimal solution to a large scale nonlinear optimization problem.  The task was to assign gifts to children, each assignment has a gift happiness and child happiness, the objective was to maximize the cube of the total gift happiness plus the cube of the total child happiness, the constraints were essentially linear.   The objective function—while nonlinear—is well modeled by a linear approximation.  The linearized problem was framed as a max-flow min-cost problem and solved exactly using Google’s OR-Tools.   The solution was then fine tuned using a greedy heuristic implemented in plain C for speed. Our final submission ranked in the top 20.6%. 

 

