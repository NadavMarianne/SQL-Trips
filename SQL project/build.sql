-- Schema
SOURCE 01_schema/trips_schema.sql;

-- Data
SOURCE 07_data/01_seed_data.sql;
SOURCE 07_data/02_extra_shifts.sql;
SOURCE 07_data/03_extra_trips.sql;

-- Triggers
SOURCE 02_triggers/01_prevent_overbooking.sql;
SOURCE 02_triggers/02_bus_maintenance.sql;

-- Views
SOURCE 03_views/01_theme_summary.sql;

-- Procedures
SOURCE 04_procedures/01_popular_themes.sql;
SOURCE 04_procedures/02_bus_status.sql;
SOURCE 04_procedures/03_shift_swap.sql;
