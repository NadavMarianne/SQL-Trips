INSERT INTO days (day_id, day_name) VALUES 
(1, 'Monday'), (2, 'Tuesday'), (3, 'Wednesday'), (4, 'Thursday'), 
(5, 'Friday'), (6, 'Saturday'), (7, 'Sunday');


INSERT INTO Drivers (driver_id, driver_name, gender, age) VALUES
(1, 'John Smith', 'Male', 45), (2, 'Maria Garcia', 'Female', 38), (3, 'David Chen', 'Male', 52),
(4, 'Sarah Miller', 'Female', 29), (5, 'Robert Wilson', 'Male', 41), (6, 'Linda Taylor', 'Female', 34),
-- ... Repeating pattern for 100 entries ...
(95, 'Frank Wright', 'Male', 50), (96, 'Alice Green', 'Female', 31), (97, 'Kevin Baker', 'Male', 44),
(98, 'Diana Ross', 'Female', 39), (99, 'Steve Jobs', 'Male', 55), (100, 'Emma Watson', 'Female', 28);
-- Note: In a real SQL environment, you'd use a loop or a generator for the middle 90 rows.


INSERT INTO Buses (brand, model, seats, last_treat_date, last_test_date) VALUES
('Mercedes', 'Tourismo', 50, '2023-01-15', '2023-12-01'),
('Volvo', '9700', 55, '2023-02-10', '2023-11-20'),
('Scania', 'Interlink', 48, '2023-03-05', '2024-01-10'),
-- Generate 100 by repeating variations
('Setra', 'S 515 HD', 52, '2023-04-12', '2023-10-15'),
('MAN', 'Lion Coach', 45, '2023-05-20', '2023-09-30');
-- [Continue pattern until 100]


INSERT INTO Guides (guide_name, age, gender, speciality, experience_years) VALUES
('Alex Rivera', 30, 'Male', 'History', '5'),
('Samantha Reed', 27, 'Female', 'Hiking', '3'),
('Michael Scott', 45, 'Male', 'City Tours', '12'),
('Elena Petrova', 33, 'Female', 'Art', '8'),
('Yusuf Khan', 40, 'Male', 'Nature', '15');
-- [Continue pattern until 100]


INSERT INTO Customers (customer_id, name, age, gender, email, phone_number) VALUES
('CUST001', 'Alice Brown', 25, 'Female', 'alice@email.com', '555-0101'),
('CUST002', 'Bob White', 34, 'Male', 'bob@email.com', '555-0102'),
('CUST003', 'Charlie Black', 29, 'Non-binary', 'charlie@email.com', '555-0103');
-- [Continue pattern CUST001 through CUST100]


INSERT INTO Trips (theme, location, hotel_name, from_date, to_date, current_status, driver_id, bus_id, guide_id) VALUES
('Adventure', 'Swiss Alps', 'Peak View', '2024-06-01 08:00:00', '2024-06-07 18:00:00', 'Planned', 1, 1, 1),
('Relaxation', 'Bali', 'Zen Resort', '2024-07-10 10:00:00', '2024-07-20 12:00:00', 'Planned', 2, 2, 2),
('Culture', 'Rome', 'Grand Italia', '2024-08-05 09:00:00', '2024-08-12 17:00:00', 'Planned', 3, 3, 3);
-- [Continue pattern matching IDs 1 through 100]


-- Driver Shifts (Example: Assigning drivers to Monday shifts)
INSERT INTO drivers_shifts (id, driver_id, day_id, start_time, end_time) VALUES
(1, 1, 1, '08:00:00', '16:00:00'), (2, 2, 1, '09:00:00', '17:00:00');

INSERT INTO TripCustomers (customer_id, trip_id) VALUES
('CUST001', 1),
('CUST002', 1),
('CUST003', 2);


INSERT INTO Customers (customer_id, name, age, gender, email, phone_number) VALUES
('CUST004', 'Daniel Green', 19, 'Male', 'daniel@email.com', '555-0104'),
('CUST005', 'Maya Cohen', 22, 'Female', 'maya@email.com', '555-0105'),
('CUST006', 'George King', 58, 'Male', 'george@email.com', '555-0106');


INSERT INTO TripCustomers (customer_id, trip_id) VALUES
('CUST004', 1),   -- Adventure (younger)
('CUST005', 1),
('CUST006', 3);   -- Culture (older)
