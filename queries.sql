SELECT 
    t.theme AS trip_theme,
    AVG(c.age) AS average_age
FROM Trips t
JOIN TripCustomers tc 
    ON t.trip_id = tc.trip_id
JOIN Customers c 
    ON tc.customer_id = c.customer_id
GROUP BY t.theme
ORDER BY average_age ASC;




-- query2
DROP VIEW IF EXISTS trip_theme_summary;

CREATE VIEW trip_theme_summary AS
SELECT 
    t.theme,
    COUNT(DISTINCT t.trip_id) AS total_trips,
    COUNT(tc.customer_id) AS total_customers,
    ROUND(AVG(DATEDIFF(t.to_date, t.from_date)), 1) AS avg_trip_duration_days
FROM Trips t
LEFT JOIN TripCustomers tc 
    ON t.trip_id = tc.trip_id
GROUP BY t.theme;

DROP PROCEDURE IF EXISTS get_popular_themes;

DELIMITER $$

CREATE PROCEDURE get_popular_themes(IN min_customers INT)
BEGIN
    SELECT *
    FROM trip_theme_summary
    WHERE total_customers >= min_customers
    ORDER BY total_customers DESC;
END $$

DELIMITER ;


SELECT 
    t.theme,
    COUNT(DISTINCT t.trip_id) AS total_trips,
    COUNT(tc.customer_id) AS total_customers,
    ROUND(AVG(DATEDIFF(t.to_date, t.from_date)), 1) AS avg_trip_duration_days
FROM Trips t
LEFT JOIN TripCustomers tc 
    ON t.trip_id = tc.trip_id
GROUP BY t.theme
ORDER BY total_customers DESC;



-- query3
SELECT 
    g.guide_name,
    g.speciality,
    COUNT(DISTINCT t.trip_id) AS total_trips,
    COUNT(tc.customer_id) AS total_customers
FROM Guides g
JOIN Trips t 
    ON g.guide_id = t.guide_id
LEFT JOIN TripCustomers tc 
    ON t.trip_id = tc.trip_id
GROUP BY g.guide_id, g.guide_name, g.speciality
ORDER BY total_customers DESC, total_trips DESC;


-- query4
