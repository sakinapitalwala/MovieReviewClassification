#For dataset movie_review
library(text2vec)
# For Text cleaning and corpus
library(tm)
#For Naive bayes
library(e1071)
#For confusion matrix
library(caret)
#For RandomForest
library(randomForest)

#obtain movie review dataset
data('movie_review')
dataset <- movie_review
rm(movie_review)

#cleaning
#Create corpus
review_corpus <- Corpus(VectorSource(dataset$review))

#case-folding
review_corpus <- tm_map(review_corpus, tolower)

#remove stop-words
review_corpus <- tm_map(review_corpus, removeWords, c('i','its','it','us','use','used','using','will','yes','say','can','take','one', stopwords('english')))

#remove punctuation marks
review_corpus <- tm_map(review_corpus, removePunctuation)

#remove numbers
review_corpus <- tm_map(review_corpus, removeNumbers)

#Stem document
review_corpus <-tm_map(review_corpus, stemDocument)

#remove extra whitespaces
review_corpus <- tm_map(review_corpus, stripWhitespace)

#Create document term matrix
dtm <- DocumentTermMatrix(review_corpus)

#Remove sparse terms
dtm <- removeSparseTerms(dtm, 0.999)

#form a dataframe
data <- data.frame(as.matrix(dtm))

#Add the sentiment column to data
data$c <- as.factor(dataset$sentiment)

#Split data into train and test
train <- data[sample(nrow(data),4800,replace = F),]
test <- data[!(1:nrow(data) %in% row.names(train)),]

#Fit Naivebayes to the train data
model_nb <- naiveBayes(c ~ ., data = train)

#Predict for the test data
prediction_nb <- predict(model_nb, test[,-7348])

#Confusion Matrix
cm_nb = table(test[, 7348], prediction_nb)
confusionMatrix(cm_nb)

#Fit Random Forest to the train data
model_rf <- randomForest(c ~ ., train, ntree = 10)

#Predict for the test data
prediction_rf <- predict(model_rf, test[,-7348])

#Confusion Matrix
cm_rf = table(test[, 7348], prediction_rf)
confusionMatrix(cm_rf)