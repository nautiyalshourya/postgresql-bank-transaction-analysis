# postgresql-bank-transaction-analysis

# Bank Account Management SQL Project

## Overview
This is a beginner-friendly SQL project built in PostgreSQL using a Kaggle bank transaction dataset. The project demonstrates how to import raw CSV data, validate data quality, clean and transform records, and load them into a structured transaction table for analysis.

## Objectives
- Build a simple banking project in PostgreSQL
- Import transaction data from a CSV file
- Validate and clean raw imported data
- Load clean records into final tables
- Perform SQL-based transaction analysis

## Tools Used
- PostgreSQL
- Excel
- Kaggle Dataset
- SQL

## Dataset
The dataset contains bank transaction records for multiple accounts. It includes the following fields:
- Account No
- Date
- Transaction Details
- Cheque Number
- Value Date
- Withdrawal Amount
- Deposit Amount
- Balance Amount

## Database Tables
- accounts
- transactions
- customers
- branches
- bank_raw

## Project Workflow
1. Create the database tables
2. Insert account numbers into the accounts table
3. Create a raw staging table
4. Import CSV data into the raw table
5. Validate raw imported data
6. Clean and load data into the transactions table
7. Validate final loaded data
8. Run analysis queries
9. Create summary views

## SQL Concepts Used
- CREATE TABLE
- INSERT INTO
- COPY
- Data validation queries
- Data cleaning with REPLACE, NULLIF, TO_DATE
- GROUP BY
- Aggregate functions
- Views

## Key Analysis Performed
- Total deposits by account
- Total withdrawals by account
- Monthly transaction trends
- High-value transactions
- Latest recorded balance by account

## Folder Structure
```text
bank-account-management-sql-project/
├── README.md                         # Project overview and documentation
├── .gitignore                        # Ignored system/editor files
├── dataset/
│   └── bank_transactions.csv         # Source dataset used in the project
├── sql/
│   ├── 01_create_tables.sql          # Creates core database tables
│   ├── 02_insert_accounts.sql        # Inserts unique account IDs
│   ├── 03_create_raw_table.sql       # Creates raw staging table
│   ├── 04_import_raw_data.sql        # Imports CSV into raw table
│   ├── 05_validate_raw_data.sql      # Validates imported raw data
│   ├── 06_load_transactions.sql      # Cleans and loads final transaction data
│   ├── 07_validate_final_data.sql    # Validates final transaction table
│   ├── 08_analysis_queries.sql       # Business analysis SQL queries
│   └── 09_views.sql                  # Creates reusable summary views
├── images/
│   └── erd.png                       # Database schema / ERD image
└── outputs/
    └── sample_results.md             # Query outputs or summary notes
```

## How to Run
1. Open PostgreSQL and create the database
2. Run the SQL scripts in order from the `sql/` folder
3. Import the CSV into `bank_raw`
4. Load cleaned records into `transactions`
5. Run analysis queries

## Project Status
Completed as a beginner SQL portfolio project.

## Author
Shourya Nautiyal
