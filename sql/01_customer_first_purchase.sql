SELECT
    customer_id,
    MIN(order_purchase_timestamp) AS first_purchase_date
FROM orders
GROUP BY customer_id;