# Customer Retention & Cohort Analysis

## Project Overview
This project analyzes customer retention behavior using cohort analysis techniques.  
The goal is to understand how many customers return after their first purchase and how retention changes over time.

This project was built as part of my BI/Data Analytics portfolio to demonstrate practical skills in:
- SQL
- Cohort Analysis
- Retention Metrics
- Customer Behavior Analysis
- Power BI Dashboarding

---

## Business Problem
For many businesses, acquiring customers is expensive.  
However, acquisition alone is not enough — companies also need to understand whether customers come back and make repeat purchases.

This project answers questions such as:
- How many customers return after their first purchase?
- What is the repeat customer rate?
- Which monthly customer cohorts retain better over time?
- How does customer activity change after the first purchase?

---

## Key Metrics
- Total Customers
- New Customers
- Repeat Customers
- Repeat Customer Rate
- Retention Rate
- Average Orders per Customer

---

## Project Structure
```text
customer-retention-cohort-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── sql/
│   ├── 01_customer_first_purchase.sql
│   ├── 02_cohort_base.sql
│   ├── 03_retention_table.sql
│   └── 04_repeat_customer_metrics.sql
│
├── powerbi/
│   └── customer_retention_dashboard.pbix
│
├── images/
│   └── dashboard_preview.png
│
├── docs/
│   └── business_questions.md
│
├── README.md
└── .gitignore
```

## Dataset
This project uses e-commerce transactional data with customer orders and purchase timestamps.

Main fields used:
customer_id
order_id
order_purchase_timestamp

## Analysis Approach
1. Identify the first purchase date for each customer
This is used to assign each customer to a cohort.

2. Define cohort month
Each customer is grouped by the month of their first purchase.

3. Track future purchases
For each cohort, customer activity is tracked in later months.

4. Build retention table
Retention is measured using the count of distinct returning customers.

## Example SQL Logic
```
SELECT
    customer_id,
    MIN(order_purchase_timestamp) AS first_purchase_date
FROM orders
GROUP BY customer_id;
```
This query identifies the first purchase date for each customer.

## Planned Dashboard Pages
1. Customer Overview
2. Cohort Retention Analysis
3. Repeat Purchase Behavior

## Skills Demonstrated
- SQL aggregations
- CTEs
- Date logic
- Cohort analysis
- Retention calculations
- Power BI data modeling
- Business thinking for BI

## Status
In progress

🔙 [Back to Portfolio](https://github.com/BlladeRunner)