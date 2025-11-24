SELECT
  *
FROM
shopping_trends.sales.sales_data
LIMIT
  10;

-- EDA: understanding the Data given  
-- Checking values in the columns

SELECT DISTINCT gender
FROM shopping_trends.sales.sales_data;

SELECT DISTINCT item_purchased
FROM shopping_trends.sales.sales_data;

SELECT DISTINCT category
FROM shopping_trends.sales.sales_data;  

SELECT DISTINCT location
FROM shopping_trends.sales.sales_data; 

---------------------------------------------------------------------
-- Analysis based on age

SELECT MAX(age)
FROM shopping_trends.sales.sales_data;

SELECT MIN(age)
FROM shopping_trends.sales.sales_data;

CASE
    WHEN age BETWEEN 18 AND 30 THEN 'Youth'
    WHEN age BETWEEN 31 AND 40 THEN 'Adult'
    WHEN age BETWEEN 41 AND 50 THEN 'Senoir'
    ELSE 'Elder'
END AS Age_Bucket;

---------------------------------------------------------------------

SELECT MAX("Purchase Amount (USD)")
FROM shopping_trends.sales.sales_data;

SELECT MIN("Purchase Amount (USD)")
FROM shopping_trends.sales.sales_data;

CASE
    WHEN "Purchase Amount (USD)" BETWEEN 20 AND 30 THEN '01. 20-30: Low Spend'
    WHEN "Purchase Amount (USD)" BETWEEN 31 AND 50 THEN '02. 31-50: Medium Spend'
    WHEN "Purchase Amount (USD)" BETWEEN 51 AND 70 THEN '03. 51-70: High Spend'
    ELSE '04. 70+ Very High Spend'
END AS Spend_Bucket;

---------------------------------------------------------------------

SELECT MIN(review_rating)
FROM shopping_trends.sales.sales_data;

SELECT MAX(review_rating)
FROM shopping_trends.sales.sales_data;

SELECT DISTINCT review_rating
FROM shopping_trends.sales.sales_data;

CASE
    WHEN review_rating BETWEEN 1.5 AND 3.0 THEN'Bad'
    WHEN review_rating BETWEEN 3.1 AND 4.0 THEN'Neutral'
    ELSE 'Good'
END AS Review_Rating_Bucket;

------------------------------------------------------------------

SELECT TO_DATE(processdate) AS Purchase_Date,
    DAYNAME(processdate) AS Day_Name,
    MONTHNAME(processdate) AS Month_Name,
    TO_CHAR(TO_DATE(processdate), 'YYYYMM') AS Month_ID,
    DAYOFMONTH(TO_DATE(processdate)) AS Day_of_Month,
    CASE
        WHEN review_rating BETWEEN 1.5 AND 3.0 THEN'Bad'
        WHEN review_rating BETWEEN 3.1 AND 4.0 THEN 'Neutral'
        ELSE 'Good'
    END AS Review_Rating_Bucket,

    -- Aggregations

    SUM("Purchase Amount (USD)") AS Revenue,
    COUNT(DISTINCT CUSTOMER_ID) AS Number_of_Customers,
    SUBSCRIPTION_STATUS,
    SHIPPING_TYPE,
    DISCOUNT_APPLIED,
    PROMO_CODE_USED,
    PAYMENT_METHOD,
    FREQUENCY_OF_PURCHASES,
    
    CASE
        WHEN "Purchase Amount (USD)" BETWEEN 20 AND 30 THEN '01. 20-30: Low Spend'
        WHEN "Purchase Amount (USD)" BETWEEN 31 AND 50 THEN '02. 31-50: Medium Spend'
        WHEN "Purchase Amount (USD)" BETWEEN 51 AND 70 THEN '03. 51-70: High Spend'
        ELSE '04. 70+ Very High Spend'
    END AS Spend_Bucket,
    
    CASE
         WHEN age BETWEEN 18 AND 30 THEN 'Youth'
         WHEN age BETWEEN 31 AND 40 THEN 'Adult'
         WHEN age BETWEEN 41 AND 50 THEN 'Senoir'
         ELSE 'Elder'
    END AS Age_Bucket,
    LOCATION,
    ITEM_PURCHASED,
    gender

FROM shopping_trends.sales.sales_data

GROUP BY ALL;




