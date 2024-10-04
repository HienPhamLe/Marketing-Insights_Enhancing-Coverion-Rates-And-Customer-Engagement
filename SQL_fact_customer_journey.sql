
SELECT
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	COALESCE(Duration, avg_duration) AS Duration
FROM (
	SELECT
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		UPPER(Stage) AS Stage,
		Action,
		Duration,
		AVG(Duration) OVER (PARTITION BY ProductID) AS avg_duration,
		ROW_NUMBER() OVER (
			PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
			ORDER BY JourneyID
		) AS row_num
	FROM
		ShopEasy_MarketingDataset.dbo.customer_journey
) AS subquery
WHERE
	row_num = 1
ORDER BY JourneyID;

