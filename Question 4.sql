Query 4 Total Spent Per Country Compared with Number of Tracks Sold?

SELECT i.billingcountry AS Country, SUM(iv.unitprice * iv.quantity) AS Sales, COUNT(t.trackid) AS No_Tracks
FROM Invoice i
JOIN InvoiceLine iv
ON i.invoiceid = iv.invoiceid
JOIN track t
ON t.trackid = iv.trackid
GROUP BY i.billingcountry
ORDER BY sales DESC;
