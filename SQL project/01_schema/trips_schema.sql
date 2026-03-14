DROP SCHEMA IF EXISTS trips;
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
    driver_id INT(11) UNSIGNED,
    bus_id INT(11) UNSIGNED,
    guide_id INT(11) UNSIGNED,
    PRIMARY KEY (trip_id)
);

CREATE TABLE days (
    day_id INT(11) UNSIGNED,
    day_name VARCHAR(10),
    PRIMARY KEY (day_id)
);

CREATE TABLE Drivers (
    driver_id INT(11) UNSIGNED,
    driver_name VARCHAR(25),
    gender VARCHAR(10),
    age INT(11),
    PRIMARY KEY (driver_id)
);

CREATE TABLE drivers_shifts (
    id INT(11),
    driver_id INT(11) UNSIGNED NOT NULL,
    day_id INT(11) UNSIGNED NOT NULL,
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (id)
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
    customer_id VARCHAR(10) NOT NULL,
    trip_id INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY (customer_id, trip_id)
);



/* ***************************************************************
***************************FOREIGN KEYS***************************
**************************************************************** */

ALTER TABLE Trips
ADD CONSTRAINT fk_trips_driver
FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
ADD CONSTRAINT fk_trips_bus
FOREIGN KEY (bus_id) REFERENCES Buses(bus_id),
ADD CONSTRAINT fk_trips_guide
FOREIGN KEY (guide_id) REFERENCES Guides(guide_id);

ALTER TABLE drivers_shifts
ADD CONSTRAINT fk_shift_driver
FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
ADD CONSTRAINT fk_shift_day
FOREIGN KEY (day_id) REFERENCES days(day_id);
