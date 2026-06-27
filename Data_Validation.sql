SELECT COUNT(*) FROM customers;        -- expect 100
SELECT COUNT(*) FROM geography;        -- expect 10
SELECT COUNT(*) FROM products;         -- expect 20
SELECT COUNT(*) FROM customer_journey; -- expect ~7297
SELECT COUNT(*) FROM customer_reviews; -- expect ~1446
SELECT COUNT(*) FROM engagement_data;  


--- checking duplicate

SELECT CustomerID, ProductID, VisitDate, Stage, Action, COUNT(*) AS Cnt
FROM customer_journey
GROUP BY CustomerID, ProductID, VisitDate, Stage, Action
HAVING COUNT(*) > 1;

----Stage casing variants:

SELECT DISTINCT Stage FROM customer_journey;

SELECT DISTINCT Stage COLLATE Latin1_General_CS_AS AS Stage_CS FROM customer_journey;


SELECT COUNT(*) AS NullDurations FROM customer_journey WHERE Duration IS NULL;

SELECT COUNT(*) AS UnexpectedNulls
FROM customer_journey
WHERE Duration IS NULL AND Action <> 'Drop-off';



-- contentType casing on engagement data

SELECT DISTINCT ContentType FROM engagement_data;

SELECT DISTINCT ContentType COLLATE Latin1_General_CS_AS AS ContentType_CS FROM engagement_data;


-- 
SELECT TOP 10 ViewsClicksCombined FROM engagement_data;

--Reviews whitespace check
SELECT TOP 10 ReviewID, ReviewText
FROM customer_reviews
WHERE LEN(ReviewText) <> LEN(TRIM(ReviewText));