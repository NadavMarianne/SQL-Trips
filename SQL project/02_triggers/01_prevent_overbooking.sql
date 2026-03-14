DELIMITER //

CREATE TRIGGER trg_manage_trip_capacity
BEFORE INSERT ON TripCustomers
FOR EACH ROW
BEGIN
    DECLARE total_customers INT;
    DECLARE bus_capacity INT;

    -- Count existing customers on this trip
    SELECT COUNT(*) INTO total_customers
    FROM TripCustomers
    WHERE trip_id = NEW.trip_id;

    -- Get bus capacity for this trip
    SELECT b.seats INTO bus_capacity
    FROM Trips t
    JOIN Buses b ON t.bus_id = b.bus_id
    WHERE t.trip_id = NEW.trip_id;

    -- Prevent overbooking
    IF total_customers >= bus_capacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add customer: Bus is fully booked';
    END IF;

    -- If this insertion fills the bus, update trip status
    IF total_customers + 1 = bus_capacity THEN
        UPDATE Trips
        SET current_status = 'Full'
        WHERE trip_id = NEW.trip_id;
    END IF;

END;
//

DELIMITER ;
