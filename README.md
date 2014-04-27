Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r fig.width=7, fig.height=6}
plot(cars)
```
## 1) Read train_set and test_set by using cbind to merge one data set named "data_set_clean".
## 2) Generate new data set by using grepl() fuction to extract variables that contain "mean()" and "std()". 
## 3) Read train_label,activity_label and test_label by using merge function to get the activity label of train and test data set which describes the row name of the data set that mentioned in 1).
## 4) Divide the data set to groups according to activity label . Then calculate average value of variables that in each group. Merge the result into a new data set "data_set_clean2".
