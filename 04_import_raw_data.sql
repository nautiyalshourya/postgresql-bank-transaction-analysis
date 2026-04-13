-- ============================================
-- 04_import_raw_data.sql
-- Imports CSV data into the raw staging table
-- ============================================

COPY bank_raw(account_no, txn_date, transaction_details, chq_no, value_date, withdrawal_amt, deposit_amt, balance_amt)
FROM 'D:\\Learning PostgreSQL\\Projects 1 (Bank Transaction Data)\\bank_transactions.csv'
WITH (FORMAT csv, HEADER true);