-- =================================================================================
-- Fitbit Capstone — Analysis SQL Script
-- Purpose: create schema, define tables, perform integrity checks, aggregate
-- minute/hour data to daily level, build master table, and save insights.
-- =================================================================================

-- 0. Create database & use
-- Purpose: create a separate database/schema for the project.
CREATE DATABASE IF NOT EXISTS fitbit_capstone;
USE fitbit_capstone;

-- -------------------------
-- 1. Create tables (structure)
-- Purpose: define tables to match transformed CSV sheets. Import data into these tables
-- 
-- Daily activity (one row per user per day)
DROP TABLE IF EXISTS daily_activity;
CREATE TABLE daily_activity (
  id BIGINT,
  activity_date DATE,
  day_of_week VARCHAR(10),
  week_number INT,
  total_steps INT,
  total_distance DECIMAL(6,2),
  tracker_distance DECIMAL(6,2),
  logged_activities_distance DECIMAL(6,2),
  very_active_distance DECIMAL(6,2),
  moderately_active_distance DECIMAL(6,2),
  light_active_distance DECIMAL(6,2),
  sedentary_active_distance DECIMAL(6,2),
  very_active_minutes INT,
  fairly_active_minutes INT,
  lightly_active_minutes INT,
  sedentary_minutes INT,
  calories INT,
  PRIMARY KEY(id, activity_date)
);

-- Minute-level sleep (each row ~ 1 minute)
DROP TABLE IF EXISTS minute_sleep;
CREATE TABLE minute_sleep (
  id BIGINT,
  activity_date DATE,
  activity_time TIME,
  sleep_state TINYINT, -- 0 = asleep, 1 = awake (per your transform)
  log_id BIGINT
);

-- Hourly steps (hour-level)
DROP TABLE IF EXISTS hourly_steps;
CREATE TABLE hourly_steps (
  id BIGINT,
  activity_date DATE,
  activity_time TIME,
  step_total INT,
  PRIMARY KEY(id, activity_date, activity_time)
);

-- Hourly calories (hour-level)
DROP TABLE IF EXISTS hourly_calories;
CREATE TABLE hourly_calories (
  id BIGINT,
  activity_date DATE,
  activity_time TIME,
  calories INT,
  PRIMARY KEY(id, activity_date, activity_time)
);

-- Hourly intensities (hour-level)
DROP TABLE IF EXISTS hourly_intensities;
CREATE TABLE hourly_intensities (
  id BIGINT,
  activity_date DATE,
  activity_time TIME,
  total_intensity INT,
  average_intensity DECIMAL(6,2),
  PRIMARY KEY(id, activity_date, activity_time)
);

-- Second-level heart rate (trimmed sample)
DROP TABLE IF EXISTS heartrate_seconds;
CREATE TABLE heartrate_seconds (
  id BIGINT,
  activity_date DATE,
  activity_time TIME,
  heartrate_value INT
);

-- Weight logs (sparse)
DROP TABLE IF EXISTS weight_log;
CREATE TABLE weight_log (
  Id BIGINT,
  Activity_Date DATE,
  Activity_Time TIME,
  Weight_Kg DECIMAL(6,2),
  Weight_Pounds DECIMAL(6,2),
  Fat TINYINT,
  BMI INT,
  Is_Manual_Report BOOLEAN,
  LogId BIGINT,
  PRIMARY KEY(Id, Activity_Date, Activity_Time)
);

-- --------------------------------------------------------------------------------
-- 2. Row counts & quick integrity checks
-- Purpose: confirm imports succeeded and basic dataset shape (rows, distinct users, date ranges).


-- Row counts per table (validate import)
SELECT 'daily_activity' AS table_name, COUNT(*) AS row_count FROM daily_activity
UNION ALL
SELECT 'minute_sleep', COUNT(*) FROM minute_sleep
UNION ALL
SELECT 'hourly_steps', COUNT(*) FROM hourly_steps
UNION ALL
SELECT 'hourly_calories', COUNT(*) FROM hourly_calories
UNION ALL
SELECT 'hourly_intensities', COUNT(*) FROM hourly_intensities
UNION ALL
SELECT 'heartrate_seconds', COUNT(*) FROM heartrate_seconds
UNION ALL
SELECT 'weight_log', COUNT(*) FROM weight_log;

-- Distinct user count (primary population check)
SELECT COUNT(DISTINCT id) AS distinct_users FROM daily_activity;

-- Date range checks to ensure consistent time windows
SELECT 'daily_activity' AS table_name, MIN(activity_date) AS min_date, MAX(activity_date) AS max_date FROM daily_activity
UNION ALL
SELECT 'minute_sleep', MIN(activity_date), MAX(activity_date) FROM minute_sleep
UNION ALL
SELECT 'hourly_steps', MIN(activity_date), MAX(activity_date) FROM hourly_steps;

-- Look for impossible heart rate values (sanity check)
SELECT COUNT(*) AS invalid_hr_records FROM heartrate_seconds
WHERE heartrate_value < 30 OR heartrate_value > 220;

-- -------------------------
-- 3. Create helpful indexes
-- -------------------------
-- Purpose: speed up joins and aggregate queries used in analysis.
CREATE INDEX idx_daily ON daily_activity(id, activity_date);
CREATE INDEX idx_sleep ON minute_sleep(id, activity_date);
CREATE INDEX idx_steps ON hourly_steps(id, activity_date, activity_time);
CREATE INDEX idx_cal ON hourly_calories(id, activity_date, activity_time);
CREATE INDEX idx_intensity ON hourly_intensities(id, activity_date, activity_time);
CREATE INDEX idx_hr ON heartrate_seconds(id, activity_date, activity_time);
CREATE INDEX idx_weight ON weight_log(id, activity_date);


-- --------------------------------------------------------------------------------
-- 4. Aggregate minute/hour data into daily summary tables
-- --------------------------------------------------------------------------------
-- Purpose: summarize high-frequency data (minute/second/hour) into daily metrics for easy join/analysis.

-- 4.1 Daily sleep: sum minutes asleep (sleep_state = 0) -> minutes & hours
DROP TABLE IF EXISTS sleep_daily;
CREATE TABLE sleep_daily AS
SELECT
    id,
    activity_date,
    SUM(CASE WHEN sleep_state = 0 THEN 1 ELSE 0 END) AS total_sleep_minutes,
    ROUND(SUM(CASE WHEN sleep_state = 0 THEN 1 ELSE 0 END) / 60, 2) AS sleep_hours
FROM minute_sleep
GROUP BY id, activity_date;

-- 4.2 Daily steps from hourly steps
DROP TABLE IF EXISTS steps_daily;
CREATE TABLE steps_daily AS
SELECT
    id,
    activity_date,
    SUM(step_total) AS daily_steps
FROM hourly_steps
GROUP BY id, activity_date;

-- 4.3 Daily calories from hourly calories
DROP TABLE IF EXISTS calories_daily;
CREATE TABLE calories_daily AS
SELECT
    id,
    activity_date,
    SUM(calories) AS daily_calories_burned
FROM hourly_calories
GROUP BY id, activity_date;

-- 4.4 Daily intensity summary
DROP TABLE IF EXISTS intensity_daily;
CREATE TABLE intensity_daily AS
SELECT
    id,
    activity_date,
    SUM(total_intensity) AS daily_total_intensity,
    ROUND(AVG(average_intensity), 2) AS daily_avg_intensity
FROM hourly_intensities
GROUP BY id, activity_date;

-- 4.5 Daily heart rate summary (average, min, max)
DROP TABLE IF EXISTS heartrate_daily;
CREATE TABLE heartrate_daily AS
SELECT
    id,
    activity_date,
    ROUND(AVG(heartrate_value), 2) AS avg_heartrate,
    MAX(heartrate_value) AS max_heartrate,
    MIN(heartrate_value) AS min_heartrate
FROM heartrate_seconds
GROUP BY id, activity_date;

-- --------------------------------------------------------------------------------
-- 5. Build the daily_master combined analysis table
-- --------------------------------------------------------------------------------
-- Purpose: left-join daily_activity with all daily aggregates so each row contains activity, sleep,
--          steps/calories aggregated from hourly/minute data, heart rate summary, and weight (if any).

DROP TABLE IF EXISTS daily_master;
CREATE TABLE daily_master AS
SELECT
    da.id,
    da.activity_date,
    da.day_of_week,
    da.week_number,

    da.total_steps AS reported_total_steps,
    sd.daily_steps AS hourly_total_steps,

    da.total_distance,
    da.tracker_distance,
    da.logged_activities_distance,
    da.very_active_distance,
    da.moderately_active_distance,
    da.light_active_distance,
    da.sedentary_active_distance,

    da.very_active_minutes,
    da.fairly_active_minutes,
    da.lightly_active_minutes,
    da.sedentary_minutes,

    da.calories AS reported_calories,
    cd.daily_calories_burned,

    sl.total_sleep_minutes,
    sl.sleep_hours,

    ind.daily_total_intensity,
    ind.daily_avg_intensity,

    hr.avg_heartrate,
    hr.max_heartrate,
    hr.min_heartrate,

    wl.Weight_Kg AS weight_kg,
    wl.Weight_Pounds AS weight_pounds,
    wl.BMI AS bmi,
    wl.Fat AS fat
FROM daily_activity da
LEFT JOIN steps_daily sd      ON da.id = sd.id AND da.activity_date = sd.activity_date
LEFT JOIN calories_daily cd   ON da.id = cd.id AND da.activity_date = cd.activity_date
LEFT JOIN sleep_daily sl      ON da.id = sl.id AND da.activity_date = sl.activity_date
LEFT JOIN intensity_daily ind ON da.id = ind.id AND da.activity_date = ind.activity_date
LEFT JOIN heartrate_daily hr  ON da.id = hr.id AND da.activity_date = hr.activity_date
LEFT JOIN weight_log wl       ON da.id = wl.Id AND da.activity_date = wl.Activity_Date;

-- Quick validation: check combined rows and NULLs
SELECT COUNT(*) AS daily_master_rows, SUM(CASE WHEN sleep_hours IS NULL THEN 1 ELSE 0 END) AS null_sleep_rows FROM daily_master;
SELECT COUNT(DISTINCT id) AS users_in_master FROM daily_master;

-- --------------------------------------------------------------------------------
-- 6. Core analysis queries (insights)
-- --------------------------------------------------------------------------------
-- Purpose: run the key aggregations and descriptive analyses used in your case study.

-- 6.1 Overall summary metrics (avg steps, avg sleep, avg heartrate)
SELECT
    COUNT(*) AS total_days,
    ROUND(AVG(COALESCE(hourly_total_steps, reported_total_steps)),0) AS avg_steps,
    ROUND(AVG(COALESCE(sleep_hours,0)),2) AS avg_sleep_hours,
    ROUND(AVG(COALESCE(avg_heartrate,0)),1) AS avg_heartrate
FROM daily_master;

-- 6.2 Average steps by day of week (ordered)
SELECT
    day_of_week,
    ROUND(AVG(COALESCE(hourly_total_steps, reported_total_steps)),0) AS avg_steps
FROM daily_master
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

-- 6.3 Sleep vs Steps — simple averages (high level check)
SELECT
    ROUND(AVG(sleep_hours),2) AS avg_sleep,
    ROUND(AVG(COALESCE(hourly_total_steps, reported_total_steps)),0) AS avg_steps
FROM daily_master;

-- 6.4 Sedentary minutes vs calories (averages)
SELECT
    ROUND(AVG(sedentary_minutes),0) AS avg_sedentary,
    ROUND(AVG(COALESCE(reported_calories, cd.daily_calories_burned,0)),0) AS avg_calories
FROM daily_master
LEFT JOIN calories_daily cd ON daily_master.id = cd.id AND daily_master.activity_date = cd.activity_date;

-- 6.5 Daily heart rate trend (by date)
SELECT
    activity_date,
    ROUND(AVG(avg_heartrate),1) AS daily_avg_heartrate
FROM daily_master
GROUP BY activity_date
ORDER BY activity_date;

-- 6.6 Top 10 most active users (by average steps)
SELECT
    id,
    ROUND(AVG(COALESCE(hourly_total_steps, reported_total_steps)),0) AS avg_steps
FROM daily_master
GROUP BY id
ORDER BY avg_steps DESC
LIMIT 10;

-- --------------------------------------------------------------------------------
-- 7. Persisting insight tables (save intermediate results for reporting/visualization)
-- --------------------------------------------------------------------------------
-- Purpose: materialize common aggregations into tables for easy export to R/BI tools.

DROP TABLE IF EXISTS insight_steps_by_day;
CREATE TABLE insight_steps_by_day AS
SELECT day_of_week, ROUND(AVG(COALESCE(hourly_total_steps, reported_total_steps)),0) AS avg_steps
FROM daily_master
GROUP BY day_of_week;

DROP TABLE IF EXISTS insight_active_hours;
CREATE TABLE insight_active_hours AS
SELECT
    HOUR(activity_time) AS hour,
    ROUND(AVG(step_total),0) AS avg_steps
FROM hourly_steps
GROUP BY hour
ORDER BY hour;

-- --------------------------------------------------------------------------------
-- 8. Final ordered results for reporting
-- --------------------------------------------------------------------------------
SELECT * FROM insight_steps_by_day
ORDER BY
  CASE day_of_week
    WHEN 'Monday' THEN 1
    WHEN 'Tuesday' THEN 2
    WHEN 'Wednesday' THEN 3
    WHEN 'Thursday' THEN 4
    WHEN 'Friday' THEN 5
    WHEN 'Saturday' THEN 6
    WHEN 'Sunday' THEN 7
  END;

-- Active hours (hour 0-23)
SELECT * FROM insight_active_hours
ORDER BY hour;
