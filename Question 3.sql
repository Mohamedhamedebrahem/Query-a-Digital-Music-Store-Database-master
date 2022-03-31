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
