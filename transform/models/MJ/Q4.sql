WITH RankedVendors AS (
  SELECT
    V.vendor_name,
    O.country_name,
    O.date_local AS year,
    Round(SUM(O.gmv_local),2) AS total_gmv,
    DENSE_RANK() OVER (PARTITION BY O.country_name, EXTRACT(YEAR FROM O.date_local) ORDER BY SUM(O.gmv_local) DESC) AS vendor_rank
  FROM PandaSet.Orders AS O
  INNER JOIN PandaSet.Vendors AS V ON O.vendor_id = V.id
  GROUP BY V.vendor_name, O.country_name, O.date_local
)
SELECT year ,country_name, vendor_name,  total_gmv
FROM RankedVendors
WHERE vendor_rank <= 2
ORDER BY year, country_name,  vendor_rank;
