USE projects;

SELECT
  signup_month AS month,
  COUNT(*) AS signups
FROM zoom_cleaned
GROUP BY signup_month
ORDER BY signup_month;

SELECT
  DATE_FORMAT(end_date, '%Y-%m-01') AS churn_month,
  COUNT(*) AS churned_users
FROM zoom_cleaned
WHERE churned = 1
GROUP BY churn_month
ORDER BY churn_month;

SELECT
  signup_month AS month,
  COUNT(*) AS active_users
FROM zoom_cleaned
WHERE churned = 0
GROUP BY signup_month
ORDER BY signup_month;

SELECT
  SUM(churned) / COUNT(*) AS churn_rate
FROM zoom_cleaned;

SELECT
  plan_type,
  COUNT(*) AS total_users,
  SUM(churned) AS churned_users,
  SUM(churned) / COUNT(*) AS churn_rate
FROM zoom_cleaned
GROUP BY plan_type;

SELECT
  country,
  COUNT(*) AS total_users,
  SUM(churned) AS churned_users,
  SUM(churned) / COUNT(*) AS churn_rate
FROM zoom_cleaned
GROUP BY country;

SELECT
  signup_month AS month,
  SUM(monthly_price) AS mrr
FROM zoom_cleaned
WHERE churned = 0
GROUP BY signup_month
ORDER BY signup_month;

SELECT
  plan_type,
  SUM(monthly_price) AS active_revenue
FROM zoom_cleaned
WHERE churned = 0
GROUP BY plan_type;

SELECT
  AVG(DATEDIFF(end_date, start_date)) AS avg_lifetime_days
FROM zoom_cleaned
WHERE churned = 1;
