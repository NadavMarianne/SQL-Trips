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
