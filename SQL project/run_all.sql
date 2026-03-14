-- Schema
SOURCE 01_schema/trips_schema.sql;

-- Data
SOURCE 07_data/seed_data.sql;

-- Triggers
SOURCE 02_triggers/01_prevent_overbooking.sql;
SOURCE 02_triggers/02_bus_maintenance.sql;

-- Views
SOURCE 03_views/01_theme_summary.sql;

-- Procedures
SOURCE 04_procedures/01_popular_themes.sql;
SOURCE 04_procedures/02_bus_status.sql;