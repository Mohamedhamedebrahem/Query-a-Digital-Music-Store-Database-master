# Query-a-Digital-Music-Store-Part-I-

# INTRODUCTION :
In this lab, you will query the Chinook Database. The Chinook Database holds information about a music store. For this lab, you will be answering 4 queries to help the Chinook team understand the media in their store, their customers and employees, and their invoice information. To assist you in the queries ahead, the schema for the Chinook Database is provided below. You can see the columns that link tables together via the arrows.
# Chinook Database
![alt text](https://github.com/mamineofficial/Query-a-Digital-Music-Store-Part-I-/blob/master/chinook%20DATBASE.png)

# Task
For this lab, you will help the Chinook team understand the media in their store, their customers and employees, and their invoice information.

# Key Takeaways
-Write queries to extract data from multiple tables in a database
-Use SQL to make data informed decisions
# INSTRUCTIONS :

In order to help the team at Chinook music store, you need to answer the following 4 queries

# Q1 
Query 1 - In Which Year, Which Country Spent The Most Money and How Much in Total? */
```sql
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

```

# Q2 
Query 2 Which Genres Have an Average Track Unit Price More Than Overall Average? */

SELECT 
   g.name AS Genre,
   AVG(t.UnitPrice) AS "Average Unit Price", 
   (SELECT ROUND(AVG(unitprice),2) 
   FROM Track ) AS "Overall Average"
FROM Track t
JOIN Genre g
ON t.GenreId = g.GenreId
WHERE T.UnitPrice > 
		(
		SELECT AVG(unitprice)
		FROM Track
		)
GROUP BY 1

```

# Q3
Query 3 Top 10 Albums based on sales?

SELECT a.albumid, a.title, ar.name AS Artist_Name, SUM(iv.unitprice * iv.quantity) AS Sales
FROM Artist ar
JOIN Album a
ON ar.artistid = a.artistid
JOIN Track t
ON a.albumid = t.albumid
JOIN InvoiceLine iv
ON iv.trackid = t.trackid
GROUP BY a.albumid
ORDER BY Sales DESC
LIMIT 10;
```
# Q4 
Query 4 Total Spent Per Country Compared with Number of Tracks Sold?

SELECT i.billingcountry AS Country, SUM(iv.unitprice * iv.quantity) AS Sales, COUNT(t.trackid) AS No_Tracks
FROM Invoice i
JOIN InvoiceLine iv
ON i.invoiceid = iv.invoiceid
JOIN track t
ON t.trackid = iv.trackid
GROUP BY i.billingcountry
ORDER BY sales DESC;
```
