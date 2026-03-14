-- Step 1: Preview current experience levels before modification
SELECT guide_name, experience_years FROM Guides;

-- Step 2: Execute the global update
-- This adds exactly one year to every record in the table
UPDATE Guides
SET experience_years = experience_years + 1;

-- Step 3: Confirm the update was successful
SELECT 'Maintenance Task: Guide experience updated successfully' AS Status;
SELECT guide_name, experience_years AS new_experience_years FROM Guides;