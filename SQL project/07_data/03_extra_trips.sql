-- Adding diverse trip dates to test the Status Sync logic
-- This includes current trips (2026), and future trips (2027)

INSERT INTO Trips (trip_id, guide_id, bus_id, driver_id, theme, location, hotel_name, from_date, to_date, current_status) VALUES
-- Past Trip (Should become 'Completed')
(10, 1, 1, 1, 'Historical', 'Jerusalem', 'Old City Inn', '2025-05-10', '2025-05-15', 'Upcoming'),

-- Future Trip (Should stay 'Upcoming')
(11, 2, 2, 2, 'Adventure', 'Eilat', 'Red Sea Resort', '2027-06-01', '2027-06-07', 'Upcoming'),

-- Another Future Trip in 2027
(12, 3, 3, 3, 'Nature', 'Galilee', 'Green Valley Hotel', '2027-09-15', '2027-09-20', 'Upcoming'),

-- A Trip happening right now (Should become 'Active')
-- Uses CURDATE() to ensure it is always active during your demo
(13, 1, 2, 3, 'Culture', 'Tel Aviv', 'Urban Stay', DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Upcoming');
