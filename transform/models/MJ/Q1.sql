SELECT 
  country_name AS Country , Round(Sum(gmv_local),2) AS Total_Gmv_Local From PandaSet.Orders
  group by (Country)
  