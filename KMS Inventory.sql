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

------Joining Order Status with KMS Inventory Table
SELECT * FROM [dbo].Order_Status
SELECT * FROM [dbo].[KMS Inventory]


SELECT
	[KMS Inventory].Order_ID,
	[KMS Inventory].Customer_Name,
	[KMS Inventory].Order_Date,
	[KMS Inventory].Product_Category,
	[KMS Inventory].Sales,
	Order_Status.Status
FROM
	[KMS Inventory]
LEFT JOIN
	Order_Status
ON
	[KMS Inventory].Order_ID = Order_Status.Order_ID


10 ---- Which customer returned items, and what segment do they belong to?
SELECT 
	[KMS Inventory].Customer_Name,
	[KMS Inventory].Customer_Segment,
	[KMS Inventory].Order_ID
FROM [KMS Inventory]
INNER JOIN 
	(
	VALUES  (65, 'Returned'), 
			(69, 'Returned'), 
			(134, 'Returned'), 
			(230, 'Returned'),
			(324, 'Returned'),
			(359, 'Returned'),
			(612, 'Returned'),
			(614, 'Returned'),
			(678, 'Returned'),
			(710, 'Returned'),
			(740, 'Returned'),
			(775, 'Returned'),
			(833, 'Returned'),
			(902, 'Returned'),
			(928, 'Returned'),
			(930, 'Returned'),
			(1060, 'Returned'),
			(1127, 'Returned'),
			(1285, 'Returned'),
			(1317, 'Returned'),
			(1382, 'Returned'),
			(1538, 'Returned'),
			(1665, 'Returned'),
			(1921, 'Returned'),
			(2050, 'Returned'),
			(2052, 'Returned'),
			(2055, 'Returned'),
			(2146, 'Returned'),
			(2213, 'Returned'),
			(2240, 'Returned'),
			(2500, 'Returned'),
			(2503, 'Returned'),
			(2562, 'Returned'),
			(2823, 'Returned'),
			(2915, 'Returned'),
			(3300, 'Returned'),
			(3456, 'Returned'),
			(3525, 'Returned'),
			(3589, 'Returned'),
			(3687, 'Returned'),
			(3777, 'Returned'),
			(3783, 'Returned'),
			(4006, 'Returned'),
			(4037, 'Returned'),
			(4230, 'Returned'),
			(4261, 'Returned'),
			(4391, 'Returned'),
			(4610, 'Returned'),
			(4738, 'Returned'),
			(4864, 'Returned'),
			(4960, 'Returned'),
			(5028, 'Returned'),
			(5059, 'Returned'),
			(5061, 'Returned'),
			(5189, 'Returned'),
			(5381, 'Returned'),
			(5414, 'Returned'),
			(5511, 'Returned'),
			(5699, 'Returned'),
			(6054, 'Returned'),
			(6241, 'Returned'),
			(6272, 'Returned'),
			(6498, 'Returned'),
			(6500, 'Returned'),
			(6502, 'Returned'),
			(6661, 'Returned'),
			(6695, 'Returned'),
			(6757, 'Returned'),
			(6978, 'Returned'),
			(6979, 'Returned'),
			(7079, 'Returned'),
			(7107, 'Returned'),
			(7203, 'Returned'),
			(7269, 'Returned'),
			(7364, 'Returned'),
			(7521, 'Returned'),
			(7744, 'Returned'),
			(7812, 'Returned'),
			(7815, 'Returned'),
			(7841, 'Returned'),
			(7845, 'Returned'),
			(8034, 'Returned'),
			(8133, 'Returned'),
			(8292, 'Returned'),
			(8293, 'Returned'),
			(8353, 'Returned'),
			(8961, 'Returned'),
			(9027, 'Returned'),
			(9093, 'Returned'),
			(9152, 'Returned'),
			(9219, 'Returned'),
			(9472,	'Returned'),
			(9574,	'Returned'),
			(9696,	'Returned'),
			(9701,	'Returned'),
			(9762,	'Returned'),
			(9829,	'Returned'),
			(9895,	'Returned'),
			(9923,	'Returned'),
			(9927,	'Returned'),
			(10054,	'Returned'),
			(10183,	'Returned'),
			(10498,	'Returned')

	)
	AS Order_Status([Order_ID], Status)
ON
	[KMS Inventory].Order_ID = Order_Status.Order_ID;
     


