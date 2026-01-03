USE projects;

CREATE TABLE zoom_cleaned AS
SELECT
    user_id,
    plan_type,
    monthly_price,
    STR_TO_DATE(start_date, '%Y-%m-%d') AS start_date,
    STR_TO_DATE(NULLIF(TRIM(end_date), ''), '%Y-%m-%d') AS end_date,
    country,
    status,
    IF(end_date IS NULL OR TRIM(end_date) = '', 0, 1) AS churned,
    DATE_FORMAT(STR_TO_DATE(start_date, '%Y-%m-%d'), '%Y-%m-01') AS signup_month
FROM zoom;