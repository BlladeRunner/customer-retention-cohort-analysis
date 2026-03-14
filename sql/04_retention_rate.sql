WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_purchase_timestamp) AS first_purchase_date
    FROM orders
    GROUP BY customer_id
),

cohort_base AS (
    SELECT
        o.customer_id,
        DATE_TRUNC('month', f.first_purchase_date) AS cohort_month,
        (
            EXTRACT(YEAR FROM AGE(DATE_TRUNC('month', o.order_purchase_timestamp), DATE_TRUNC('month', f.first_purchase_date))) * 12
            + EXTRACT(MONTH FROM AGE(DATE_TRUNC('month', o.order_purchase_timestamp), DATE_TRUNC('month', f.first_purchase_date)))
        ) AS months_since_first_purchase
    FROM orders o
    JOIN first_purchase f
        ON o.customer_id = f.customer_id
),

cohort_counts AS (
    SELECT
        cohort_month,
        months_since_first_purchase,
        COUNT(DISTINCT customer_id) AS retained_customers
    FROM cohort_base
    GROUP BY
        cohort_month,
        months_since_first_purchase
),

cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM cohort_base
    WHERE months_since_first_purchase = 0
    GROUP BY cohort_month
)

SELECT
    c.cohort_month,
    c.months_since_first_purchase,
    c.retained_customers,
    s.total_customers,
    ROUND(c.retained_customers * 100.0 / s.total_customers, 2) AS retention_rate
FROM cohort_counts c
JOIN cohort_size s
    ON c.cohort_month = s.cohort_month
ORDER BY
    c.cohort_month,
    c.months_since_first_purchase;