DELIMITER //

CREATE TRIGGER trg_check_bus_maintenance
BEFORE INSERT ON Trips
FOR EACH ROW
BEGIN
    DECLARE treat_limit DATE;
    DECLARE test_limit DATE;

    SET treat_limit = DATE_SUB(NEW.from_date, INTERVAL 6 MONTH);
    SET test_limit = DATE_SUB(NEW.from_date, INTERVAL 12 MONTH);

    IF (SELECT last_treat_date FROM Buses WHERE bus_id = NEW.bus_id) < treat_limit THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot schedule trip: Bus treatment outdated';
    END IF;

    IF (SELECT last_test_date FROM Buses WHERE bus_id = NEW.bus_id) < test_limit THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot schedule trip: Bus test outdated';
    END IF;
END;
//

DELIMITER ;
