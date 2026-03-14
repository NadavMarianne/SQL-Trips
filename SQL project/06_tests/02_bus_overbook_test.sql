-- trigger test
UPDATE Buses SET seats = 4 WHERE bus_id = 1;
INSERT INTO TripCustomers (customer_id, trip_id) VALUES ('RND101', 1);  -- Success
INSERT INTO TripCustomers (customer_id, trip_id) VALUES ('RND102', 1);  -- Success
INSERT INTO TripCustomers (customer_id, trip_id) VALUES ('RND103', 1);  -- Success
INSERT INTO TripCustomers (customer_id, trip_id) VALUES ('RND104', 1);  -- Success, bus now full
-- This one should fail (overbooking)
INSERT INTO TripCustomers (customer_id, trip_id) VALUES ('RND105', 1);  
-- Expected error: 'Cannot add customer: Bus is fully booked'