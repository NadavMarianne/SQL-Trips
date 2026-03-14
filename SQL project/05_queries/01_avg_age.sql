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
