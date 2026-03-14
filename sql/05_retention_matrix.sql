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
        DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
        (
            EXTRACT(YEAR FROM AGE(DATE_TRUNC('month', o.order_purchase_timestamp), DATE_TRUNC('month', f.first_purchase_date))) * 12
            + EXTRACT(MONTH FROM AGE(DATE_TRUNC('month', o.order_purchase_timestamp), DATE_TRUNC('month', f.first_purchase_date)))
        ) AS months_since_first_purchase
    FROM orders o
    JOIN first_purchase f
        ON o.customer_id = f.customer_id
)

SELECT
    cohort_month,
    months_since_first_purchase,
    COUNT(DISTINCT customer_id) AS retained_customers
FROM cohort_base
GROUP BY
    cohort_month,
    months_since_first_purchase
ORDER BY
    cohort_month,
    months_since_first_purchase;