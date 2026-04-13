-- ============================================
-- 08_analysis_queries.sql
-- Business analysis queries for portfolio presentation
-- ============================================

-- Total deposits by account
SELECT account_id, SUM(deposit_amt) AS total_deposit
FROM transactions
GROUP BY account_id
ORDER BY total_deposit DESC;

-- Total withdrawals by account
SELECT account_id, SUM(withdrawal_amt) AS total_withdrawal
FROM transactions
GROUP BY account_id
ORDER BY total_withdrawal DESC;

-- Monthly transaction count
SELECT DATE_TRUNC('month', txn_date) AS month, COUNT(*) AS total_transactions
FROM transactions
GROUP BY month
ORDER BY month;

-- High value transactions
SELECT *
FROM transactions
WHERE COALESCE(withdrawal_amt, 0) > 500000
   OR COALESCE(deposit_amt, 0) > 500000
ORDER BY txn_date;

-- Latest balance by account
SELECT DISTINCT ON (account_id)
    account_id,
    txn_date,
    balance_amt
FROM transactions
ORDER BY account_id, txn_date DESC;