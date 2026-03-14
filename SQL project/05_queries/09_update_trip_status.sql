UPDATE Trips
SET current_status = 
    CASE 
        WHEN CURDATE() < from_date THEN 'Upcoming'
        WHEN CURDATE() BETWEEN from_date AND to_date THEN 'Active'
        WHEN CURDATE() > to_date THEN 'Completed'
    END;

-- Verification: View the updated status of the schedule
SELECT 
    theme, 
    from_date, 
    to_date, 
    current_status 
FROM Trips 
ORDER BY from_date ASC;
