# DSA Capstone Project - Kultra Mega Stores Inventory

## Project Title: Kultra Mega Stores (KMS) Abuja Division: Business Intelligence Report (2009-2012)

### Introduction
Kultra Mega Stores (KMS) is a remarkable retail and wholesale provider of office supplies and furniture, headquartered in Lagos, Nigeria. Its diverse customers are individual consumers, small businesses, and large corporate clients across Nigeria. This report focuses on the Abuja division, leveraging historical order data from 2009 to 2012 to obtain insights that can inform strategic decisions, improve operations, and enhance customer engagement.

### Tools Used:
SQL: Querying the database to extract order details and aggregate results by customer, customer segment, product category, product name etc.

### Data Import and Cleaning:
- Imported the inventory data into SQL.
- Wrote SQL queries to retrieve the relevant sales and order data.
- Aggregated sales data by product category, province and customer segment. 
- Example SQL query for the product category had the highest sales:
```SQL
SELECT TOP 1 Product_Category,
    SUM(Sales) AS Total_Sales
FROM [KMS Inventory]
    GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC
```

### Data Overview
The provided dataset includes detailed order records with variables such as:
- Order details: Order ID, date, priority, mode of shipment.
- Financials: sales, discounts, unit prices, shipping costs, profits.
- Customer info: name, location (province, region), segment.
- Product details: category, sub-category, name, quantity.

#### Sample data highlights:
  1. Orders range from small "1 unit to large 50 units.
  2. Profit margins vary widely, with some orders showing losses (negative profit).
  3. Customer segments include Small Business, Consumer, and Corporate.
  4. Product categories include Office Supplies, Technology, and Furniture.

### Key Insights and Analysis
#### A. Customer Segmentation & Purchase Patterns
- Diverse Customer Base: Orders come from varied customer segments — Home office, Small Business, Consumer, and Corporate.
- Small Businesses: Tend to place smaller, frequent orders e.g Office Supplies, with moderate sales volumes.
- Large Corporate Clients: Make larger, high-value orders, often in Technology and Furniture categories e.g order with sales over ₦50,000.
- Implication: Tailoring marketing strategies and loyalty programs for each segment could optimize retention and sales.

#### B. Product Category Performance
- Technology Products: High-value orders, e.g telephone and communication devices, computer, often with higher profit margins.
- Furniture: Steady demand; specific sub-categories like tables, chairs show consistent sales.
- Office Supplies: Most commonly ordered, especially storage and organization items. Margins vary; some orders show negative profits, indicating potential pricing or cost issues. e.g rubber bands.

#### C. Sales and Revenue Trends (2009-2012)
- Temporal Trends: Data suggests increasing sales over the years, with notable spikes in 2011 and 2012.
- Order Priority & Performance:
  1. High-priority orders tend to be larger and more profitable.
  2. Orders with "Critical" priority show inconsistent performance, indicating potential data quality issues.
- Order Modes: Regular Air and Delivery Truck are prevalent; express air is used for urgent deliveries.

#### D. Profitability Analysis
- Profitability Variance: Some orders, despite high sales, show negative profits, possibly due to high shipping costs or discounts.
- Key Profit Drivers:
  1. Larger orders with higher unit prices tend to yield better profits.
  2. Orders with low discounts 3% tend to be more profitable.
- Loss-making Orders: Highlight the need for reviewing pricing strategies and cost management.

#### E. Geographic Insights
- Orders are distributed across provinces and regions:
  1. Larger orders originate from provinces like Ontario and West.
  2. Lower orders are from Nunavut and Northwest Territories .
- Action Point: Map customer locations to identify regional demand and optimize logistics.

#### F. Bottom Performers
Who are the bottom Performers?
|Customer Name |Total Sales|Customer Segment|Product Category
|--------------|-----------|----------------|-----------------
|Richardo Emerson|2.24|Corporate|Office Supplies
|Maria Bertelson|3.63|Corporate|Office Supplies
|Katrina Bavinger|3.77|Home Office|Office Supplies
|Andy Reiter|3.42|Corporate|Office Supplies
|Jeremy Farry|3.96|Small Business|Office Supplies
|Don Weiss|4.94|Corporate|Office Supplies
|Benjamin Patterson|3.23|Corporate|Office Supplies
|Adam Hart|3.41|Corporate|Office Supplies
|Adam Hart|3.85|Corporate|Office Supplies
|Ken Dana|3.2|Small Business|Office Supplies

Insights for Management (KMS)
1.	Upsell & Cross-sell Opportunities
	- Offer bundles or discounts on related products in their category.
	- E.g Ken Dana buys binders — offer desks or filing cabinets.
2.	Customer-Specific Promotions
   	- Provide targeted offers to Small Business and Home Office segments.
	- E.g bulk purchase discounts, loyalty incentives.
3.	Review Product Mix
   	- If they’re only buying low-cost items (e.g binders, storage) suggest higher-value alternatives.
4.	Improve Marketing Touchpoints
   	- Engage via email campaigns showcasing popular technology or high-margin products.
5.	Reduce Return-Linked Losses
   	- Richardo Emerson’s sale had negative profit → consider reviewing return policy or shipping costs.
  
#### G. Shipping Mode and Shipping Cost Performance
- Delivery Truck: Most economical, but slowest (#51,971.94).
- Regular Air: Moderate speet and cost (#48,008.19).
- Express Air: Fastest, most expensive (#7,850.91).

|Order Priority|Expected Shipping Mode|Justification|
|--------------|----------------------|-------------|
|High|Express Air|Needs fast delivery
|Medium|Regular Air|balanced speed and cost
|Low|Delivery Truck|Cost-saving

Based on the information above, the company appears to have made an appropriate decision in allocating shipping methods according to order priority. Since the delivery truck is the most economical but slowest option, it is suitable for orders with lower priority where delivery speed is less critical. Conversely, using Express Air, which is the fastest but most expensive, makes sense for high-priority orders that require quick delivery to meet customer expectations or deadlines.

This strategic approach aligns shipping costs with order importance, ensuring that higher-priority orders receive expedited service while lower-priority orders are shipped more economically. Therefore, the company’s shipping cost expenditures seem justified and appropriate based on the order priorities.

### Recommendations
- Data Quality Improvement: Address missing or inconsistent data "Order Priority" for accurate analysis.
- Customer Relationship Management: Develop targeted campaigns for high-value and repeat customers.
- Pricing & Cost Strategies: Review discount policies and shipping costs to improve profit margins.
- Inventory Optimization: Align stock levels with demand trends, especially for high-demand categories like Technology and Furniture.
- Geographic Expansion: Use regional data to identify underserved areas within Abuja, tailoring marketing efforts accordingly.
- Technology & Automation: Implement BI tools for real-time sales tracking and predictive analytics.

### Conclusions
The analysis of KMS's order data from 2009-2012 reveals valuable insights into customer behavior, product performance, and profitability. Addressing data gaps and leveraging these insights can support the Abuja division in enhancing sales, improving margins, and delivering better customer service. Strategic focus on high-margin products, customer segmentation, and regional demand will position KMS for sustained growth in Nigeria’s competitive office supplies and furniture market.

### Appendices
Data Summary Statistics
- Total Orders: 8400units
- Total Sales: #14,915,600.82
- Average Order Quantity: #25.57
- Average Profit per Order: #181.18
