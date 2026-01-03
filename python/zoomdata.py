import pandas as pd
import numpy as np
from datetime import timedelta
import random

n = 100000
id = range(1, n + 1)
plans = ["Free", "Pro", "Business"]
prices = {"Free": 0, "Pro": 15, "Business": 30}
countries = ["US", "UK", "JP", "CA", "AU"]
start_dates = pd.to_datetime("2022-01-01") + pd.to_timedelta(
    np.random.randint(0, 900, size=n), unit="D"
)
churn_flag = np.random.choice([0, 1], size=n, p=[0.7, 0.3])
end_dates = [
    sd + timedelta(days=random.randint(30, 400)) if churn else None
    for sd, churn in zip(start_dates, churn_flag)
]
plan_choices = np.random.choice(plans, size=n, p=[0.4, 0.4, 0.2])

df = pd.DataFrame({
    "user_id": id,
    "plan_type": plan_choices,
    "monthly_price": [prices[p] for p in plan_choices],
    "start_date": start_dates,
    "end_date": end_dates,
    "country": np.random.choice(countries, size=n),
    "status": ["Churned" if c else "Active" for c in churn_flag]
})

df.to_csv("zoom.csv", index=False)