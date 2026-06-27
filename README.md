# ShopEasy-Consumer-Intelligence-Funnel-Sentiment-Analysis

A end-to-end data analytics project that transforms raw e-commerce data into actionable business insights through SQL data engineering, Python NLP sentiment analysis, and an interactive Power BI dashboard.


Project Overview

ShopEasy is a fictional sports e-commerce brand selling 20 products across 10 European cities to 100 customers. This project builds a complete consumer intelligence pipeline — from raw messy data ingestion to a fully interactive 4-page dashboard — covering customer journey funnel analysis, marketing channel performance, sentiment analysis, and product health scoring.


Problem Statement

The business had fragmented raw data across 6 tables with no unified reporting system. Key challenges included:


Duplicate customer journey records inflating funnel metrics
Inconsistent casing across Stage, Action, and ContentType fields
Views and Clicks stored as a single combined string column
No structured sentiment analysis on customer reviews
No way to identify which products were underperforming across conversion, sentiment, and engagement simultaneously



Tech Stack

ToolPurposeSQL Server (SSMS)Data ingestion, validation, cleaning, transformationPython (Google Colab)VADER sentiment analysis, theme extractionPower BI DesktopData modelling, DAX measures, dashboardNLTK / VADERNLP sentiment scoringPandasData manipulation


Dataset

TableRowsDescriptioncustomer_journey.csv7,297Raw funnel events (Homepage → ProductPage → Checkout)customer_reviews.csv1,446Raw customer review text with star ratingsengagement_data.csv4,623Marketing content engagement (Views, Clicks, Likes)customers.csv100Customer demographics and age segmentsproducts.csv20Product names, categories, prices, price tiersgeography.csv10City and country mapping for European markets


Project Architecture

Raw CSVs (6 tables)
        ↓
  SQL Server (SSMS)
  ├── Data Validation
  │     ├── Duplicate detection
  │     ├── NULL analysis
  │     ├── Casing variant checks
  │     └── Combined column inspection
  └── Data Cleaning
        ├── customer_journey_cleaned
        ├── customer_reviews_cleaned
        └── engagement_data_cleaned
              ↓
        Python (Google Colab)
        ├── VADER Sentiment Scoring
        ├── Hybrid Sentiment Categorization
        ├── Negative Review Theme Tagging
        ├── customer_reviews_sentiment.csv
        └── negative_reviews_issues.csv
              ↓
         Power BI Desktop
         ├── Star Schema (8 tables, 12 relationships)
         ├── Calendar Dimension (1,095 days)
         ├── DAX Measures
         └── 4-Page Interactive Dashboard
<img width="1269" height="794" alt="Screenshot (8)" src="https://github.com/user-attachments/assets/5cb8b441-e847-4939-88cc-cf6d2451d359" />


