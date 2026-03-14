INSERT INTO drivers_shifts (driver_id, day_id, start_time, end_time)
SELECT 
    driver_id, 
    (SELECT day_id FROM days WHERE day_name = 'Monday' LIMIT 1), 
    '09:00:00', 
    '17:00:00'
FROM Drivers
WHERE driver_name IN ('Robert Wilson', 'Sarah Miller');

-- Verification: Check the newly assigned shifts
SELECT 
    d.driver_name, 
    dy.day_name, 
    s.start_time, 
    s.end_time
FROM drivers_shifts s
JOIN Drivers d ON s.driver_id = d.driver_id
JOIN days dy ON s.day_id = dy.day_id
WHERE d.driver_name IN ('Robert Wilson', 'Sarah Miller');