DELIMITER //

CREATE PROCEDURE SwapDriverShifts(
    IN name_a VARCHAR(100),
    IN name_b VARCHAR(100),
    IN day_val INT
)
BEGIN
    -- 1. Disable the safety lock
    SET FOREIGN_KEY_CHECKS = 0;

    -- 2. Perform the swap using a 'dummy' value that is safe
    UPDATE drivers_shifts SET driver_id = 0 WHERE driver_id = (SELECT driver_id FROM drivers WHERE driver_name = name_a) AND day_id = day_val;
    UPDATE drivers_shifts SET driver_id = (SELECT driver_id FROM drivers WHERE driver_name = name_a) WHERE driver_id = (SELECT driver_id FROM drivers WHERE driver_name = name_b) AND day_id = day_val;
    UPDATE drivers_shifts SET driver_id = (SELECT driver_id FROM drivers WHERE driver_name = name_b) WHERE driver_id = 0 AND day_id = day_val;

    -- 3. Re-enable the safety lock
    SET FOREIGN_KEY_CHECKS = 1;
END //

DELIMITER ;