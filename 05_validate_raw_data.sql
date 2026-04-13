-- ============================================
-- 05_validate_raw_data.sql
-- Data quality validation after CSV import
-- ============================================

SELECT COUNT(*) AS total_raw_rows FROM bank_raw;

SELECT 
    COUNT(DISTINCT REPLACE(account_no, '''', '')) AS unique_accounts,
    STRING_AGG(DISTINCT REPLACE(account_no, '''', ''), ', ') AS account_list
FROM bank_raw;

SELECT * FROM bank_raw LIMIT 10;

SELECT COUNT(*) AS empty_rows
FROM bank_raw 
WHERE account_no IS NULL 
  AND txn_date IS NULL 
  AND transaction_details IS NULL;

SELECT 
    REPLACE(account_no, '''', '') AS clean_account,
    COUNT(*) AS row_count
FROM bank_raw 
WHERE account_no IS NOT NULL
GROUP BY REPLACE(account_no, '''', '')
ORDER BY row_count DESC;

SELECT COUNT(*) AS suspicious_withdrawal
FROM bank_raw 
WHERE withdrawal_amt IS NOT NULL 
  AND withdrawal_amt !~ '^[0-9,\\. ]+$';

SELECT COUNT(*) AS suspicious_deposit
FROM bank_raw 
WHERE deposit_amt IS NOT NULL 
  AND deposit_amt !~ '^[0-9,\\. ]+$';

SELECT COUNT(*) AS bad_date_format
FROM bank_raw 
WHERE txn_date IS NOT NULL 
  AND txn_date !~ '^\\d{1,2}-[A-Za-z]{3}-\\d{2}$';

SELECT 
    COUNT(*) FILTER (WHERE account_no IS NULL) AS null_accounts,
    COUNT(*) FILTER (WHERE txn_date IS NULL) AS null_dates,
    COUNT(*) FILTER (WHERE transaction_details IS NULL) AS null_details
FROM bank_raw;

SELECT 
    'Raw Import Summary' AS report_type,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT REPLACE(account_no, '''', '')) AS unique_accounts,
    COUNT(*) FILTER (WHERE withdrawal_amt IS NOT NULL OR deposit_amt IS NOT NULL) AS rows_with_amounts
FROM bank_raw;