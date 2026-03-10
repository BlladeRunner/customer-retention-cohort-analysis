WITH customer_first_purchase AS (
    SELECT
        customer_id,
        MIN(order_purchase_timestamp) AS first_purchase_date
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    first_purchase_date,
    DATE_TRUNC('month', first_purchase_date) AS cohort_month
FROM customer_first_purchase;