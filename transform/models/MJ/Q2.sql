SELECT Vendors.vendor_name, COUNT(*) AS customer_count , SUM(Orders.gmv_local) AS total_gmv
FROM PandaSet.Orders AS Orders
INNER JOIN PandaSet.Vendors AS Vendors ON Orders.vendor_id = Vendors.id
WHERE Orders.country_name = 'Taiwan'
GROUP BY Vendors.vendor_name
ORDER BY customer_count DESC;