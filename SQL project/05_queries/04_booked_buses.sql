CALL SimpleBusStatusAll();

-- Query it like any table
SELECT *,
       CASE 
           WHEN booked_customers = total_seats THEN 'Full'
           WHEN booked_customers > total_seats THEN 'Overbooked'
           ELSE 'Available'
       END AS status
FROM temp_bus_status
ORDER BY booked_customers DESC;