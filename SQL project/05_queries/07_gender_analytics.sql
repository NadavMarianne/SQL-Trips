SELECT 
    gender,
    COUNT(customer_id) AS total_count,
    -- Calculate percentage: (Count of Gender / Total Customers) * 100
    ROUND((COUNT(customer_id) / (SELECT COUNT(*) FROM Customers)) * 100, 1) AS gender_percentage
FROM Customers
GROUP BY gender
ORDER BY gender_percentage DESC;