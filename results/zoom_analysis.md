# Zoom SaaS Analysis Results

This file presents SQL-based analysis results derived from the cleaned dataset (`zoom_cleaned`). It focuses on the calculation of core SaaS metrics using SQL. 

Interactive visualizations for this analysis are available via:
- [Tableau Public Dashboard](https://public.tableau.com/views/Zoom_17674242683410/ZoomSaaSAnalysisVisualization?:language=en-GB&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Download PDF Version](../results/Zoom_SaaS_Tableau_Dashboard.pdf)

---

## 1. Monthly Signups
- **Description:** Number of new users per month.
- **SQL Query:** 
```sql
SELECT
  signup_month AS month,
  COUNT(*) AS signups
FROM zoom_cleaned
GROUP BY signup_month
ORDER BY signup_month;
```

---

## 2. Monthly Churn
- **Description:** Number of users leaving per month.
- **SQL Query:** 
```sql
SELECT
  DATE_FORMAT(end_date, '%Y-%m-01') AS churn_month,
  COUNT(*) AS churned_users
FROM zoom_cleaned
WHERE churned = 1
GROUP BY churn_month
ORDER BY churn_month;
```

---

## 3. Active Users by Month
- **Description:** Count of active users per month.
- **SQL Query:** 
```sql
SELECT
  signup_month AS month,
  COUNT(*) AS active_users
FROM zoom_cleaned
WHERE churned = 0
GROUP BY signup_month
ORDER BY signup_month;
```

---

## 4. Overall Churn Rate
- **Description:** Percentage of users who have left.
- **SQL Query:** 
```sql
SELECT
  SUM(churned) / COUNT(*) AS churn_rate
FROM zoom_cleaned;
```

---

## 5. Churn Rate by Plan Type
- **Description:** Churn variation across subscription plans.
- **SQL Query:** 
```sql
SELECT
  plan_type,
  COUNT(*) AS total_users,
  SUM(churned) AS churned_users,
  SUM(churned) / COUNT(*) AS churn_rate
FROM zoom_cleaned
GROUP BY plan_type;
```

---

## 6. Churn Rate by Country
- **Description:** Regional churn patterns.
- **SQL Query:** 
```sql
SELECT
  country,
  COUNT(*) AS total_users,
  SUM(churned) AS churned_users,
  SUM(churned) / COUNT(*) AS churn_rate
FROM zoom_cleaned
GROUP BY country;
```

---

## 7. Monthly Recurring Revenue (MRR)
- **Description:** Total revenue from active users per month.
- **SQL Query:** 
```sql
SELECT
  signup_month AS month,
  SUM(monthly_price) AS mrr
FROM zoom_cleaned
WHERE churned = 0
GROUP BY signup_month
ORDER BY signup_month;
```

---

## 8. Active Revenue by Plan
- **Description:** Revenue from active users per plan.
- **SQL Query:** 
```sql
SELECT
  plan_type,
  SUM(monthly_price) AS active_revenue
FROM zoom_cleaned
WHERE churned = 0
GROUP BY plan_type;
```

---

## 9. Average Customer Lifetime
- **Description:** Average days a churned user stayed.
- **SQL Query:** 
```sql
SELECT
  AVG(DATEDIFF(end_date, start_date)) AS avg_lifetime_days
FROM zoom_cleaned
WHERE churned = 1;
```
