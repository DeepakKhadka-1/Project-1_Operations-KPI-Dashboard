📊 Operations KPI Dashboard

Sales, Profit, SLA & Delivery Performance Analysis (Power BI)


📌 Project Overview

This project presents an Operations KPI Dashboard developed using Python, SQL, and Power BI to analyze order volume, delivery efficiency, delayed orders, and SLA compliance across different regions.


The dashboard is designed to help business and operations teams identify delivery bottlenecks, assess SLA risk, and understand operational drivers affecting service performance.



📷 Dashboard Preview

Below is the final Power BI dashboard highlighting operational performance, SLA risk, and delivery efficiency by region.
[Operations KPI Dashboard] (./images/Dashboard.png) 



🎯 Business Problem

Operations teams often struggle with:


High delivery delays in certain regions

Low SLA compliance despite strong sales and profit

Limited visibility into whether delivery performance is improving

Difficulty identifying why SLA breaches occur

This project converts raw operational data into decision-ready insights to support data-driven operational improvements.



❓ Key Business Questions Answered


How many orders are processed overall?

What are the total sales and profit figures?

Which regions contribute the most to delayed orders?

Is delivery performance improving over time?

Which regions are at the highest SLA risk?

Are delivery delays driving SLA non-compliance?



🧰 Tools & Technologies Used
Tool	Purpose
Python (Pandas, NumPy)	Data cleaning, feature engineering
SQL (MySQL)	KPI validation and aggregations
Power BI	Interactive dashboard, DAX measures, visualization



Each tool was used deliberately to simulate a real-world analytics workflow.



📂 Dataset Information

Type: Retail Supply Chain / Operations Data

Records: ~10,000 orders

Key Fields:

Order & shipment dates

Region

Sales & profit

Delivery days

Delayed order flag

SLA compliance indicator



🔄 Analytics Workflow

1️⃣ Data Preparation (Python)

Loaded raw retail operations data

Cleaned date formats and numeric fields

Created derived metrics:

Delivery days

Delayed order indicator

SLA compliance flag

Exported a clean dataset for SQL and Power BI


2️⃣ KPI Validation (SQL)

Verified data integrity and record counts

Calculated core KPIs:

Total Orders

Total Sales

Total Profit

Delayed Orders

SLA Compliance Percentage

Performed region-level aggregations to support analysis


3️⃣ Visualization & Reporting (Power BI)

The final Operations KPI Dashboard includes:

🔹 KPI Summary

Total Orders

Total Sales

Total Profit

SLA Compliance %


🔹 Operational Performance Analysis

Delayed Orders by Region – identifies regional bottlenecks

Average Delivery Days – Monthly Trend – tracks delivery efficiency over time


🔹 SLA Risk & Root Cause Diagnosis

SLA Compliance Risk by Region – highlights regions with critical SLA risk

Delivery Delays & Efficiency by Region – compares delivery days with delayed orders to explain SLA impact

Static “Key Insights” text was intentionally removed and replaced with diagnostic visuals for faster decision-making.


📈 Key Insights

West and East regions show the highest number of delayed orders.

Average delivery days trend downward, indicating operational improvement.

SLA compliance remains below 40%, signaling systemic SLA risk.

Regions with higher delivery delays also show higher delayed orders, directly impacting SLA performance.



✅ Project Outcome

This project demonstrates how analytics can:

Expose operational inefficiencies

Identify SLA risk areas

Diagnose root causes behind delivery delays

Support data-driven operational decision-making



🚀 Skills Demonstrated

Operations & Business Analytics

KPI Design & Interpretation

Data Cleaning & Feature Engineering (Python)

SQL Aggregations & Validation

Power BI Dashboarding & DAX

Business Insight Storytelling



🎤 One-Liner

“This project analyzes operational performance by tracking delivery efficiency, delayed orders, and SLA compliance using Python, SQL, and Power BI to identify SLA risk and its operational drivers.”


📌 Disclaimer


This project is a portfolio-based analytics case study created for learning and demonstration purposes using publicly available data. It does not represent proprietary or production business data.
