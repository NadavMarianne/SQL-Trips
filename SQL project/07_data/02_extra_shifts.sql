INSERT INTO drivers_shifts (driver_id, day_id, start_time, end_time) VALUES
(1, 1, DATE_SUB(CURDATE(), INTERVAL 2 DAY), '08:00:00'),
(1, 2, DATE_SUB(CURDATE(), INTERVAL 4 DAY), '08:00:00'),
(1, 3, DATE_SUB(CURDATE(), INTERVAL 6 DAY), '08:00:00'),
(1, 4, DATE_SUB(CURDATE(), INTERVAL 8 DAY), '08:00:00'),
(1, 5, DATE_SUB(CURDATE(), INTERVAL 10 DAY), '08:00:00'),
(1, 6, DATE_SUB(CURDATE(), INTERVAL 12 DAY), '08:00:00');

INSERT INTO drivers_shifts (driver_id, day_id, start_time, end_time) VALUES
(2, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), '09:00:00'),
(2, 2, DATE_SUB(CURDATE(), INTERVAL 3 DAY), '09:00:00');

INSERT INTO drivers_shifts (driver_id, day_id, start_time, end_time) VALUES
(3, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), '07:00:00'),
(3, 2, DATE_SUB(CURDATE(), INTERVAL 3 DAY), '07:00:00'),
(3, 3, DATE_SUB(CURDATE(), INTERVAL 5 DAY), '07:00:00'),
(3, 4, DATE_SUB(CURDATE(), INTERVAL 7 DAY), '07:00:00'),
(3, 5, DATE_SUB(CURDATE(), INTERVAL 9 DAY), '07:00:00');
