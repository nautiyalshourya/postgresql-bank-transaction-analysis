-- ============================================
-- 07_validate_final_data.sql
-- Validates the final transactions table
-- ============================================

SELECT COUNT(*) AS total_transactions FROM transactions;

SELECT account_id, COUNT(*) AS txn_count
FROM transactions
GROUP BY account_id
ORDER BY txn_count DESC;

SELECT * FROM transactions LIMIT 10;

SELECT 
    COUNT(*) FILTER (WHERE withdrawal_amt IS NULL AND deposit_amt IS NULL) AS rows_without_amount,
    COUNT(*) FILTER (WHERE balance_amt IS NULL) AS null_balance_rows
FROM transactions;