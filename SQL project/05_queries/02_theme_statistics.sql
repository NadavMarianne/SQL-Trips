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
