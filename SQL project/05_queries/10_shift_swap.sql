-- Swap shifts between John and Maria for Day 1
SELECT * FROM drivers_shifts
WHERE driver_id in
(
SELECT driver_id
FROM drivers
WHERE driver_name in ('John Smith', 'Maria Garcia')
);

CALL SwapDriverShifts('John Smith', 'Maria Garcia', 1);

SELECT * FROM drivers_shifts
WHERE driver_id in
(
SELECT driver_id
FROM drivers
WHERE driver_name in ('John Smith', 'Maria Garcia')
);