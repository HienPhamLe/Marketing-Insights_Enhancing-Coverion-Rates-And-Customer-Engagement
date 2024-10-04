  
SELECT
	*,
	CASE
		WHEN Price < 50 THEN 'Low'
		WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
		ELSE 'High'
	END AS PriceCategory,
	CASE
		WHEN Price < 50 THEN 1
		WHEN Price BETWEEN 50 AND 200 THEN 2
		ELSE 3
	END AS PriceCategoryGroup
FROM ShopEasy_MarketingDataset.dbo.products;
