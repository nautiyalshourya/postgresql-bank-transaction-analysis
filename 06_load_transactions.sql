-- ============================================
-- 06_load_transactions.sql
-- Cleans raw data and loads it into final transactions table
-- ============================================

INSERT INTO transactions (
    account_id,
    txn_date,
    value_date,
    chq_no,
    txn_details,
    withdrawal_amt,
    deposit_amt,
    balance_amt
)
SELECT
    REPLACE(account_no, '''', '') AS account_id,
    TO_DATE(txn_date, 'DD-Mon-YY') AS txn_date,
    TO_DATE(value_date, 'DD-Mon-YY') AS value_date,
    NULLIF(TRIM(chq_no), '') AS chq_no,
    transaction_details,
    NULLIF(REPLACE(withdrawal_amt, ',', ''), '')::NUMERIC(14,2) AS withdrawal_amt,
    NULLIF(REPLACE(deposit_amt, ',', ''), '')::NUMERIC(14,2) AS deposit_amt,
    NULLIF(REPLACE(balance_amt, ',', ''), '')::NUMERIC(14,2) AS balance_amt
FROM bank_raw
WHERE account_no IS NOT NULL;