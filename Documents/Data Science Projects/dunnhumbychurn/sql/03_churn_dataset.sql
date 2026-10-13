-- 03_churn_dataset.sql
-- Build the time-aware training dataset with a 60-day cutoff

WITH cutoff_calc AS (
    SELECT MAX(DAY) - 60 AS cutoff_day FROM transactions
),
churn_labels AS (
    SELECT 
        household_key,
        CASE WHEN MAX(DAY) > (SELECT cutoff_day FROM cutoff_calc) THEN 0 ELSE 1 END AS churn_label
    FROM transactions
    GROUP BY household_key
),
pre_cutoff_rfm AS (
    SELECT 
        household_key,
        (SELECT cutoff_day FROM cutoff_calc) - MAX(DAY) AS recency,
        COUNT(DISTINCT BASKET_ID) AS frequency,
        SUM(SALES_VALUE) AS monetary
    FROM transactions
    WHERE DAY <= (SELECT cutoff_day FROM cutoff_calc)
    GROUP BY household_key
)
SELECT 
    l.household_key,
    l.churn_label,
    r.recency,
    r.frequency,
    r.monetary
FROM churn_labels l
JOIN pre_cutoff_rfm r ON l.household_key = r.household_key;