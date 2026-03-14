DROP PROCEDURE IF EXISTS get_popular_themes;

DELIMITER $$

CREATE PROCEDURE get_popular_themes(IN min_customers INT)
BEGIN
    SELECT *
    FROM trip_theme_summary
    WHERE total_customers >= min_customers
    ORDER BY total_customers DESC;
END $$

DELIMITER ;
