
SELECT
	c.CustomerID,
	c.CustomerName,
	c.Email,
	c.Gender,
	c.Age,
	g.Country,
	g.City,
	CASE
		WHEN Age BETWEEN 18 AND 28 THEN '18-28'
		WHEN Age BETWEEN 28 AND 38 THEN '28-38'
		WHEN Age BETWEEN 38 AND 48 THEN '38-48'
		ELSE 'Over 48'
		END AS AgeGroup
FROM
	ShopEasy_MarketingDataset.dbo.customers AS c
LEFT JOIN
	ShopEasy_MarketingDataset.dbo.geography AS g
ON
	c.GeographyID = g.GeographyID;