-- 01_create_tables.sql
-- Load raw CSV files into DuckDB tables

CREATE TABLE IF NOT EXISTS demographics AS 
SELECT * FROM read_csv_auto('../data/raw/hh_demographic.csv');

CREATE TABLE IF NOT EXISTS product AS 
SELECT * FROM read_csv_auto('../data/raw/product.csv');

CREATE TABLE IF NOT EXISTS transactions AS 
SELECT * FROM read_csv_auto('../data/raw/transaction_data.csv');