DROP PROCEDURE IF EXISTS SimpleBusStatusAll;

DELIMITER //

CREATE PROCEDURE SimpleBusStatusAll()
BEGIN
    -- Drop temp table if exists
    DROP TEMPORARY TABLE IF EXISTS temp_bus_status;

    -- Create temp table
    CREATE TEMPORARY TABLE temp_bus_status (
        bus_id INT,
        brand VARCHAR(25),
        model VARCHAR(50),
        total_seats INT,
        booked_customers INT
    );

    -- Insert aggregated data for all buses
    INSERT INTO temp_bus_status (bus_id, brand, model, total_seats, booked_customers)
    SELECT 
        b.bus_id,
        b.brand,
        b.model,
        b.seats AS total_seats,
        COUNT(tc.customer_id) AS booked_customers
    FROM Buses b
    LEFT JOIN Trips t ON b.bus_id = t.bus_id
    LEFT JOIN TripCustomers tc ON t.trip_id = tc.trip_id
    GROUP BY b.bus_id;
END;
//

DELIMITER ;