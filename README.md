# Movie Review Classification
The project predicts whether a movie review is positive or negative.

### Data Collection
Obtained the movies review data from the R package text2vec. 
###### The data contains 3 fields and 5000 observations. Fields are - 
- id (the review id)
- sentiment (target - 'positive' or 'negative' (0 or 1))
- review (text reviews)  
Create a corpus

### Data cleaning
###### Following are the steps of data cleaning
- **Case folding** - The words “amazing” and “AMAZING” hold the same meaning. If not changes to one case, will be added as two different words in the document term matrix. Thus, we need to change them to one case.
- **Remove stop words** - The words which are highly frequent and do not contribute to deciding whether the reviews are positive or negative are called stop words, e.g., “the”, “is”, “are” “I” “we” etc. They should be removed.
- **Remove Punctuation marks** - Suppose there are two reviews as following  
*“Wow!! The movie was amazing”* (positive)  
*“Bad movie!!”* (negative)  
Both the reviews contain “!” punctuation marks, but both the reviews fall into two different classes, thus the words “Wow”, “amazing”, “bad” contribute to the model and not the punctuation mark “!”. Thus, we need to remove these while pre-processing.
- **Remove Numbers** - Text may contain some numbers which will not contribute to the prediction. Those numbers if not removed to lead to a greater sparsity of the document term matrix. It will unnecessarily increase the dimension of the dataset. Thus, removing numbers from the text is required while cleaning data for text mining.
- **Stem Document** - Reduce the tokens to their root form of words. E.g., like, liked, liking all will be reduced to like.
- **Remove extra whitespaces** - Remove all extra whitespaces between words.

### Data Preparation
- Create document term matrix
- Remove sparse terms
- Create a dataframe from the document term matrix
- Add sentiment (target) column to the data
- Split data into train(4800) and test(200)

### Model fitting and prediction
Fit a Naive bayes Model to the training data  
Predict the sentiment for the test data  
Analyze the confusion matrix for the accuracy of prediction  

Fit a Random Forest Model to the training data   
Predict the sentiment for the test data  
Analyze the confusion matrix for the accuracy of prediction  
