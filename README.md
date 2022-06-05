# Shopify task
## Question 1
a. Think about what could be going wrong with our calculation. Think about a better way to evaluate this data. 
- Chosing the mean of the data given to find AOV is doubtful since the data in *order_amount* column is skewed. The big values do not let us calculate the AOV correctly. Having explored the dataset a bit, one can conlcude that shops 78 and 42 need attention because of the anomalous values in *order_amount* column. They cause outliers that affect the mean value. For this calculation, we could check the anomalies in the data and then calculate the interquartile range (IQR). It would represent the most reliable data in the column. Check the [code](shopify_solution/aov.ipynb) to see the detailed explanation and the flow of my thoughts. 

b. What metric would you report for this dataset?
- I would report the median of *order_amount* IQR after some operations in this column (Check the [code](shopify_solution/aov.ipynb) to see step-by-step solution). Why not the mean? Because there are still outliers in the data, so the median would be a more accurate observation. However, mean and median of the IQR are **$294** and **$280** correspondingly which makes them much closer than before.
  
c. What is its value?
- $280


## Question 2
### For SQL code, see the following [file](shopify_solution/sql_challenge.sql).
a. How many orders were shipped by Speedy Express in total?
- **54**

b. What is the last name of the employee with the most orders?
- **Peacock** who ordered 40 times.

c. What product was ordered the most by customers in Germany?
- **Boston Crab Meat** which was ordered 160 times in Germany