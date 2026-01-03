# Zoom SaaS User Analytics (SQL | Python | Tableau)

## Overview
This project simulates and analyzes a Zoom SaaS subscription dataset using **Python** for dataset generation, **SQL** for data cleaning and analysis, and **Tableau** for visualization.  
The focus is on understanding user growth, churn behavior, and revenue metrics for different subscription plans and regions.

---

## Dataset

- Generated using Python (`python/zoom_data.py`) with **pandas** and **numpy**.
- 100,000 subscription records.
- Columns:
  - `user_id` – Unique identifier for each user
  - `plan_type` – Subscription plan (`Free`, `Pro`, `Business`)
  - `monthly_price` – Monthly price of the plan
  - `start_date` – Subscription start date
  - `end_date` – Subscription end date (NULL if still active)
  - `country` – User country (`US`, `UK`, `JP`, `CA`, `AU`)
  - `status` – `Active` or `Churned`
- Raw dataset: `data/zoom.csv`
- Cleaned dataset (SQL processed): `data/zoom_cleaned.csv`

---

## Data Cleaning (SQL)

All data cleaning was performed in SQL (`data/zoom_cleaning.sql`) including:

- Converting `start_date` and `end_date` to **DATE** type.
- Handling empty `end_date` values for active users.
- Creating a `churned` flag (`0 = Active`, `1 = Churned`).
- Creating a `signup_month` field for monthly aggregation.
- Organizing the cleaned dataset into a new table `zoom_cleaned`.

---

## Analysis

- SQL queries were used to analyze **user signups, churn, revenue, and lifetime metrics**.
- All query outputs are visualized using Tableau. 
- Detailed results and insights are in the separate file: [`analysis/zoom_analysis.md`](analysis/zoom_analysis.md).

---

## Skills Demonstrated

- Python: dataset simulation using **pandas** and **numpy**
- SQL: data cleaning, transformation, aggregation, and business metric calculation
- Analytical thinking: interpreting churn, revenue, and customer lifetime trends
- SaaS metrics understanding: churn rate, MRR, average customer lifetime

---

## Project Structure

```
zoom-saas-user-analysis/
│
├── python/
│   └── zoom_data.py              # Python dataset generation
|
├── data/
│   ├── zoom.csv                  # Raw dataset
|   ├── zoom_cleaning.sql         # SQL cleaning
│   └── zoom_cleaned.csv          # SQL-cleaned dataset
|
├── analysis/
│   ├── zoom_analysis.pdf         # Tableau visualization
│   ├── zoom_queries.sql          # SQL analysis queries
│   └── zoom_analysis.md          # SQL results and insights
|
└── README.md                     # Project background and overview
```

---

This repo demonstrates a **full end-to-end workflow**:  
**data generation → data cleaning → SQL analysis → data visualization**.
