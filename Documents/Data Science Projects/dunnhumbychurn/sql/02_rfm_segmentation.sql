-- 02_rfm_segmentation.sql
-- Calculate RFM metrics and assign quintile segments

WITH dataset_max AS (
    SELECT MAX(DAY) AS current_day 
    FROM transactions
),
rfm_raw AS (
    SELECT 
        household_key,
        (SELECT current_day FROM dataset_max) - MAX(DAY) AS recency,
        COUNT(DISTINCT BASKET_ID) AS frequency,
        SUM(SALES_VALUE) AS monetary
    FROM transactions
    GROUP BY household_key
),
rfm_scores AS (
    SELECT 
        household_key,
        recency,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM rfm_raw
)
SELECT 
    household_key,
    r_score,
    f_score,
    m_score,
    CONCAT(r_score, f_score, m_score) AS rfm_class
FROM rfm_scores;