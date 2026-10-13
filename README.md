# Dunnhumby Customer Retention & Churn Analytics

An end-to-end business intelligence project analyzing retail customer retention using **DuckDB**, **SQL**, and **Python**.

## 📊 Project Overview
In retail, understanding customer loyalty and predicting churn is critical for revenue growth. This project builds a modular analytics pipeline to process customer transaction data, segment buyers, and predict churn risk.

## 🛠️ Project Structure
```text
Dunnhumby_customer_retention/
│
├── sql/
│   ├── 01_create_tables.sql       # Database schema setup
│   ├── 02_rfm_segmentation.sql    # RFM (Recency, Frequency, Monetary) analysis
│   └── 03_churn_dataset.sql       # Churn feature extraction dataset
│
├── data/
│   └── processed/                 # Cleaned data layers (DuckDB managed)
│
├── notebooks/                     # Exploratory analysis and modeling notebooks
└── .gitignore                     # Excludes local databases and raw data files
