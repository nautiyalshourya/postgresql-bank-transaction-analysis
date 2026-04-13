-- ============================================
-- 03_create_raw_table.sql
-- Creates a raw staging table for imported CSV data
-- ============================================

CREATE TABLE bank_raw (
    account_no VARCHAR(20),
    txn_date TEXT,
    transaction_details TEXT,
    chq_no TEXT,
    value_date TEXT,
    withdrawal_amt TEXT,
    deposit_amt TEXT,
    balance_amt TEXT
);