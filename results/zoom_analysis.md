# Zoom SaaS Analysis Results

This file presents the **SQL analysis results** from the cleaned dataset (`zoom_cleaned`) and explains each metric alongside visualization generated using Tablaeu.  

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
- **Visualization:** [`results/images/`](results/images/).
- **Insight:** 
