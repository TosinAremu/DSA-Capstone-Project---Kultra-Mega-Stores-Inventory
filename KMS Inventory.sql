SELECT * FROM [dbo].[KMS Inventory]

1. ------Which product category had the highest sales?
SELECT TOP 1 Product_Category,
    SUM(Sales) AS Total_Sales
FROM [KMS Inventory]
    GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC

2. ------What are the Top 3 and Bottom 3 regions in terms of sales?
WITH RankedRegions AS (
    SELECT 
        Region,
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER (ORDER BY SUM(Sales) DESC) AS Rank_Desc,
        ROW_NUMBER() OVER (ORDER BY SUM(Sales) ASC) AS Rank_Asc
    FROM [KMS Inventory]
    GROUP BY Region
)
SELECT 'Top 3' AS Category, Region, Total_Sales
FROM RankedRegions
WHERE Rank_Desc <= 3

UNION ALL

SELECT 'Bottom 3' AS Category, Region, Total_Sales
FROM RankedRegions
WHERE Rank_Asc <= 3;

3.----What were the total sales of appliances in Ontario?
SELECT SUM(Sales) AS Total_Sales_Appliances_Ontario
FROM [KMS Inventory]
WHERE Product_Sub_Category = 'Appliances' AND Region = 'Ontario';

4. -------The bottom 10 customer using revenue.
SELECT TOP 10 Customer_Name,
    SUM(Sales) AS Total_Sales,
    COUNT(DISTINCT [Order_ID]) AS Total_Orders,
    STRING_AGG([Product_Category], ', ') AS Categories_Purchased,
    STRING_AGG([Customer_Segment], ', ') AS Segment
FROM 
    [KMS Inventory]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales ASC


5.-----KMS incurred the most shipping cost using which shipping method?
SELECT TOP 1 Ship_Mode,
    SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM [KMS Inventory]
GROUP BY Ship_Mode
ORDER BY
    Total_Shipping_Cost DESC

6.----Who are the most valuable customers, and what products or services do they typically purchase?
SELECT Customer_Name,
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales,
    COUNT(DISTINCT [Order_ID]) AS Orders_Count,
    STRING_AGG([Product_Sub_Category], ', ') AS Purchased_Sub_Categories,
    STRING_AGG([Product_Category], ', ') AS Purchased_Categories
FROM 
    [KMS Inventory]
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Profit DESC;

7.  ------Which small business customer had the highest sales?
SELECT TOP 1 Customer_Name,
    SUM(Sales) AS Total_Sales
FROM [KMS Inventory]
WHERE 
    Customer_Segment = 'Small Business'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Sales DESC

8. ----------Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 1 Customer_Name,
    COUNT(DISTINCT [Order_ID]) AS Orders_Count
FROM 
    [KMS Inventory]
WHERE 
    [Customer_Segment] = 'Corporate'
    AND YEAR([Order_Date]) BETWEEN 2009 AND 2012
GROUP BY 
    [Customer_Name]
ORDER BY 
    Orders_Count DESC


9. -----Which consumer customer was the most profitable one?
SELECT TOP 1 Customer_Name,
    SUM(Profit) AS Total_Profit
FROM [KMS Inventory]
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Profit DESC

10 ---- Which customer returned items, and what segment do they belong to?
SELECT Customer_Name,
    Customer_Segment
FROM [KMS Inventory]
WHERE 
    Profit < 0;

