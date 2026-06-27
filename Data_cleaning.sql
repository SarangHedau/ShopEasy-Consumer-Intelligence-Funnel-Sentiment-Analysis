---  removing duplicates, standardizes Stage/Action casing


WITH ranked AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
            ORDER BY JourneyID
        ) AS rn
    FROM customer_journey
)
SELECT JourneyID,CustomerID, ProductID, VisitDate, UPPER(TRIM(Stage)) AS Stage,UPPER(TRIM(Action)) AS Action,
Duration
INTO customer_journey_cleaned
FROM ranked
WHERE rn = 1;

SELECT COUNT(*) FROM customer_journey;         
SELECT * FROM customer_journey_cleaned;

----trim whitespace 

SELECT ReviewID, CustomerID,ProductID,ReviewDate,Rating,
    TRIM(REPLACE(REPLACE(ReviewText, CHAR(13), ''), CHAR(10), '')) AS ReviewText
INTO customer_reviews_cleaned
FROM customer_reviews;

SELECT * FROM customer_reviews_cleaned;    



---standardizes ContentType casing, splits ViewsClicksCombined 

SELECT EngagementID, ContentID,UPPER(TRIM(ContentType)) AS ContentType,Likes,EngagementDate,CampaignID,
    ProductID,
    CAST(LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS INT) AS Views,
    CAST(SUBSTRING(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) + 1, LEN(ViewsClicksCombined)) AS INT) AS Clicks
INTO engagement_data_cleaned
FROM engagement_data;


SELECT * FROM engagement_data_cleaned;



