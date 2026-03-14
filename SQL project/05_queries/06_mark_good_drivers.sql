START TRANSACTION;

UPDATE Drivers
SET driver_name = CONCAT(driver_name, ' (VIP)')
WHERE driver_name NOT LIKE '%(VIP)%'
AND driver_id IN (
    SELECT driver_id
    FROM drivers_shifts
    WHERE start_time >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY driver_id
    HAVING COUNT(id) >= 5
);

UPDATE Drivers
SET driver_name = REPLACE(driver_name, ' (VIP)', '')
WHERE driver_name LIKE '%(VIP)%'
AND driver_id NOT IN (
    SELECT driver_id
    FROM drivers_shifts
    WHERE start_time >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY driver_id
    HAVING COUNT(id) >= 5
);
COMMIT;

SELECT driver_id, driver_name FROM Drivers;