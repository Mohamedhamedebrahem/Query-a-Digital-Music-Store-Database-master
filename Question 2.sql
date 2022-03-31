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
