# view data from dataset 
select * from data;

# count total data imported from dataset
select count(*) from data;

#Total Revenue & Profit
SELECT 
sum(Sales) AS Total_Revenue,
sum(Profit) AS Total_Profit
FROM data;

# sale by Product Category
SELECT 
Product_Category,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM data
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

# top Products by Revenue
SELECT 
Product, SUM(Sales) AS Total_Sales
FROM data
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;

# payment mode by total sell value
SELECT 
Payment_method,
SUM(Sales) AS Total_Sales
FROM data
GROUP BY Payment_method
ORDER BY Total_Sales DESC;

# high sales from which mode (device)
SELECT 
Device_Type,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM data
GROUP BY Device_Type
ORDER BY Total_Sales DESC;

# customers Who Generated Above Average Profit
SELECT Customer_Id, SUM(Profit) AS Total_Profit FROM data
GROUP BY Customer_Id
HAVING SUM(Profit) > ( SELECT AVG(Profit) FROM data) 
ORDER BY Total_Profit desc limit 20;

# products Selling Above Average Sales
SELECT Product, SUM(Sales) AS Total_Sales
FROM data
GROUP BY Product
HAVING SUM(Sales) > ( SELECT AVG(Sales) FROM data ) 
order by Total_Sales desc;

# Sales & Profit by Gender
SELECT 
Gender,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM data
GROUP BY Gender;

# Average Order Value
SELECT  AVG(Sales) AS Avg_Order_Value
FROM data;

# created view on category performanced well
CREATE VIEW category_performance AS
SELECT 
Product_Category,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
AVG(Discount) AS Avg_Discount
FROM data 
GROUP BY Product_Category;

# view category_performance from views
SELECT * FROM category_performance;

# created Index on Product Category
CREATE INDEX idx_category ON ecommerce(Product_Category);