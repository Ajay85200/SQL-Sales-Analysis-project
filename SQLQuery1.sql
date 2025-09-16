create Database sales_Data;
use sales_Data;
select * from customers;
select * from order_details;
select * from orders;
select * from products;

-- Key SQL Tasks:
-- Find total revenue per month (using GROUP BY + DATE functions).
-- Find top 5 best-selling products.
-- Identify loyal customers (customers with most orders).
-- Find revenue contribution by each product category.
-- Calculate average order value (AOV).
-- Perform customer segmentation (by region, age group, etc.).
-- Create a running total of revenue over time (using window functions).


-- Find total revenue per month
select OrderDate as Month,
       sum(TotalAmount) as MonthlyRevenue
from orders
group by OrderDate
order by Month;

-- Find top 5 best-selling products
select * from products;
select * from Order_details;
select p.ProductName,
       sum(OD.Quantity) as TotalSold
from order_details OD
join products p on p.ProductID = OD.ProductID
group by p.ProductName
order by TotalSold DESC;

-- Identify loyal customers (customers with most orders)
select * from orders;
select * from customers;
select C.Name,
       count(O.orderID) as Totalorders
from orders O 
join customers C on C.CustomerID = O.CustomerID
group by C.Name
order by Totalorders
Desc


-- Find revenue contribution by each product category.
select * from products
select p.Category,
       sum(OD.LineTotal) as Revenue
from order_details OD 
join products p on p.ProductID = OD.ProductID
group by p.Category
order by Revenue Desc
select * from order_details;
select * from products


-- Calculate average order value (AOV)
select sum(TotalAmount)*1.0/count(distinct OrderID)as avg_order_val from orders;
select * from orders

-- Perform customer segmentation (by region, age group, etc.)
select * from customers;
select * from orders;
select 
      C.Region,
	  count(Distinct C.CustomerID) as TotalCustomers,
	  sum(O.TotalAmount) as TotalRevenue
from customers C
join orders O on C.CustomerID = O.CustomerID
group by C.Region
order by TotalRevenue Desc;


-- Perform customer segmentation (by region, age group, etc.).
-- segment by Age Group
SELECT
    CASE
	   WHEN C.Age < 25 THEN 'Youth(<25)'
	   WHEN C.Age BETWEEN 25 AND 34 THEN 'Young Adults(25-34)'
	   WHEN C.Age BETWEEN 35 AND 50 THEN 'Middle Age(35-50)'
	   ELSE 'Senior (50+)'
	END AS AgeGroup,
	COUNT(DISTINCT C.CustomerID) as TotalCustomers,
	sum(O.TotalAmount) as TotalRevenue,
	Avg(O.TotalAmount) as Avgordervalue
from customers C
join orders O on C.CustomerID = O.CustomerID
group by 
        CASE
	   WHEN C.Age < 25 THEN 'Youth(<25)'
	   WHEN C.Age BETWEEN 25 AND 34 THEN 'Young Adults(25-34)'
	   WHEN C.Age BETWEEN 35 AND 50 THEN 'Middle Age(35-50)'
	   ELSE 'Senior (50+)'
	END
order by TotalRevenue DESC;

SELECT * FROM 
-- Create a running total of revenue over time (using window functions).
SELECT * from orders;
select OrderDate,
       TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderDate) As RunningRevenue
From orders
order by OrderDate;
     



     
