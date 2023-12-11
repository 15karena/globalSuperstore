USE portofolioProject

SELECT * FROM Orders
ORDER BY 1

SELECT * FROM Orders
WHERE [Ship Date] < [Order Date]

SELECT [Row ID], [Customer ID], COUNT(*) FROM Orders
GROUP BY [Row ID], [Customer ID]
ORDER BY 1

SELECT DISTINCT  [Customer ID] FROM Orders

SELECT 
    Orders.[Product ID], 
    Orders.[Product Name], 
    COUNT(Orders.[Order ID]) AS total_product_purchased, 
    AVG(Orders.[Sales]) AS average_price,
	AVG(Orders.[Shipping Cost]) AS average_shipping_cost,
    AVG(Orders.[Profit]) AS average_profit
FROM Orders
GROUP BY 
    Orders.[Product ID], 
    Orders.[Product Name]
ORDER BY 
    total_product_purchased DESC;


SELECT 
    Orders.[Customer ID], 
	Orders.[Order ID],
    ShipMode.[Ship Mode] AS Ship_Mode, 
    Segment.[Segment] AS Customer_Segment,
    COUNT(Orders.[Order ID]) AS total_product
FROM Orders
JOIN (
    SELECT DISTINCT [Ship Mode]
    FROM Orders
) AS ShipMode ON Orders.[Ship Mode] = ShipMode.[Ship Mode]
JOIN (
    SELECT DISTINCT [Segment]
    FROM Orders
) AS Segment ON Orders.[Segment] = Segment.[Segment]
GROUP BY 
    Orders.[Customer ID],
	Orders.[Order ID],
    ShipMode.[Ship Mode], 
    Segment.[Segment];


SELECT TOP 3 [Country], COUNT(DISTINCT [Customer ID]) AS total_customers
FROM Orders
GROUP BY [Country]
ORDER BY total_customers desc

SELECT DATEDIFF(DAY, [Order Date], [Ship Date]) AS number_of_days, * FROM Orders
