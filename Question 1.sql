Query 1 - In Which Year, Which Country Spent The Most Money and How Much in Total? */

WITH CTE AS
	(
	SELECT 
	   c.Country, 
	   strftime('%Y', i.InvoiceDate) AS Year, 
	   ROUND(SUM(i.total),2) AS total_sales
	FROM Invoice AS i
	JOIN InvoiceLine il
	ON i.InvoiceId = il.InvoiceId
	JOIN Customer AS c
	ON c.CustomerId = i.CustomerId
	GROUP BY 1,2
	)

SELECT 
   Country, 
   Year,
   MAX(total_sales)AS Max_Sales
FROM CTE
GROUP BY 2
ORDER BY 2
