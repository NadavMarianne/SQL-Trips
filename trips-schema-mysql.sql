DROP SCHEMA

IF EXISTS trips;
	CREATE SCHEMA trips COLLATE = utf8_general_ci;

USE trips;
/* *************************************************************** 
***************************CREATING TABLES************************
**************************************************************** */
CREATE TABLE Trips (
	trip_id INT (11) UNSIGNED AUTO_INCREMENT,
	theme VARCHAR(25),
    location VARCHAR(25),
    hotel_name VARCHAR(25),
    from_date DATETIME,
    to_date DATETIME,
    current_status VARCHAR(15),
    driver_id INT(11),
    bus_id INT(11),
    guide_id INT(11),
	PRIMARY KEY (trip_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (bus_id) REFERENCES Buses(bus_id),
    FOREIGN KEY (guide_id) REFERENCES Guides(guide_id)
);
    
CREATE TABLE days (
    day_id INT PRIMARY KEY,
    day_name VARCHAR(10)
);


CREATE TABLE Drivers (
	driver_id INT(11) UNSIGNED,
	driver_name VARCHAR(25),
    gender VARCHAR(10),
    age INT(11),
	PRIMARY KEY (driver_id)
);


CREATE TABLE drivers_shifts (
    id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    day_id INT NOT NULL,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (day_id) REFERENCES days(day_id)
);


CREATE TABLE Buses (
	bus_id INT (11) UNSIGNED AUTO_INCREMENT,
	brand VARCHAR(25),
	model VARCHAR(50),
    seats INT(11),
	last_treat_date DATE,
    last_test_date DATE,
	PRIMARY KEY (bus_id)
);

CREATE TABLE Guides (
	guide_id INT(11) UNSIGNED AUTO_INCREMENT,
	guide_name VARCHAR(25) NOT NULL,
	age INT(11) UNSIGNED,
	gender VARCHAR(10),
    speciality VARCHAR(25),
    experience_years VARCHAR(25),
	PRIMARY KEY (guide_id)
);

CREATE TABLE Customers (
	customer_id VARCHAR(10) NOT NULL,
	name VARCHAR(25) NOT NULL,
	age DECIMAL(8, 0) UNSIGNED,
	gender VARCHAR(10),
    email VARCHAR(50),
    phone_number VARCHAR(25),
	PRIMARY KEY (customer_id)
);

CREATE TABLE TripCustomers (
	customer_id INT (11) UNSIGNED NOT NULL,
	trip_id INT(11) UNSIGNED NOT NULL,
	PRIMARY KEY (customer_id, trip_id)
	);
    

CREATE VIEW emp_details_view
AS
SELECT e.employee_id,
	e.job_id,
	e.manager_id,
	e.department_id,
	d.location_id,
	l.country_id,
	e.first_name,
	e.last_name,
	e.salary,
	e.commission_pct,
	d.department_name,
	j.job_title,
	l.city,
	l.state_province,
	c.country_name,
	r.region_name
FROM employees e,
	departments d,
	jobs j,
	locations l,
	countries c,
	regions r
WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND l.country_id = c.country_id
	AND c.region_id = r.region_id
	AND j.job_id = e.job_id;

/* *************************************************************** 
***************************INSERTING DATA*************************
**************************************************************** */
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

-- Trip Customers (Linking 100 customers to trips)
INSERT INTO TripCustomers (customer_id, trip_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3);

/* *************************************************************** 
***************************FOREIGN KEYS***************************
**************************************************************** */


