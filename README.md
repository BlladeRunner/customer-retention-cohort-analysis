# Customer Retention & Cohort Analysis

## Project Overview
This project analyzes customer retention behavior using **cohort analysis** to understand how customers engage after their first purchase.

The main goal is to identify:
- how many customers return,
- how retention evolves over time,
- and how customer loyalty impacts business performance.

This project was developed as part of my **Data Analytics / BI portfolio** and demonstrates real-world analytical thinking and dashboard development.

## Business Problem
Customer acquisition is costly, and long-term business success depends on **retaining customers**, not just acquiring them.

This project answers key business questions:
- How many customers return after their first purchase?
- What is the repeat customer rate?
- How does retention change across different cohorts?
- How quickly do customers churn after their first order?

## Key Metrics
- Total Customers  
- Total Orders  
- Repeat Customers  
- Repeat Customer Rate  
- Retention Rate (Cohort-based)  
- Orders per Customer  

## 🧠 Methodology

### 1. Customer Identification
Customers were tracked using `customer_unique_id` to ensure accurate retention analysis.

> ⚠️ Using `customer_id` would lead to incorrect results because one real customer can have multiple IDs.

### 2. Cohort Definition
Each customer is assigned to a cohort based on their **first purchase month**:

```sql
SELECT
    customer_unique_id,
    MIN(order_purchase_timestamp) AS first_purchase_date
FROM orders
GROUP BY customer_unique_id;
```
### 3. Cohort Tracking
Customer activity is tracked across future months using:
- Cohort Month
- Order Month
- Month Number (difference in months)

### 4. Retention Calculation
Retention is calculated as:
```
Retention Rate =
Active Customers in Month N / Total Customers in Month 0
```

## 📈 Key Findings
🔻 Retention drops sharply after the first purchase
📉 Month 1 retention is typically below 1%
⚠️ Long-term retention is extremely low across all cohorts
📊 Repeat Customer Rate is only ~3%

👉 Insight:
This indicates weak customer loyalty and high churn, meaning most customers do not return after their first purchase.

## 📊 Dashboard Overview
🔹 Customer Overview
- Total Customers: ~99K
- Total Orders: ~99K
- Repeat Customers: ~3K
- Repeat Rate: ~3.01%

🔹 Cohort Retention Heatmap
- Visual representation of retention over time
- Shows rapid drop-off after Month 0
- Conditional formatting used for better visibility

## 🛠 Tools Used

- SQL (data transformation & cohort preparation)
- Power BI (dashboard & data modeling)
- DAX (retention logic & measures)
- Excel (data exploration)


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

## 📸 Dashboard Preview



## 🎯 Business Recommendations
- Improve customer retention strategies (loyalty programs, follow-ups)
- Focus on post-purchase engagement
- Analyze reasons for early churn
- Optimize customer experience after first order

## 📚 What I Learned
- How to build cohort analysis from scratch
- Importance of correct customer identifiers
- How to calculate retention using DAX
- How to translate data into business insights
- How to build dashboards that tell a story

📌 Status
✅ Completed

🔙 [Back to Portfolio](https://github.com/BlladeRunner)