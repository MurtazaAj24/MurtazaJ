WITH RankedVendors AS (
  SELECT
    Vendors.vendor_name,
    Orders.country_name,
    Round(SUM(Orders.gmv_local),2) AS total_gmv,
    RANK() OVER (PARTITION BY Orders.country_name ORDER BY SUM(Orders.gmv_local) DESC) AS rank
  FROM PandaSet.Orders AS Orders
  INNER JOIN PandaSet.Vendors AS Vendors ON Orders.vendor_id = Vendors.id
  GROUP BY Vendors.vendor_name, Orders.country_name
)
SELECT  country_name,vendor_name, total_gmv
FROM RankedVendors
WHERE rank = 1
ORDER BY RankedVendors.country_name ASC;