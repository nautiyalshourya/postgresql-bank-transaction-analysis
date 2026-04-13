-- ============================================
-- 09_views.sql
-- Creates reusable views for summary reporting
-- ============================================

CREATE VIEW vw_account_summary AS
SELECT
    account_id,
    COUNT(*) AS total_transactions,
    SUM(deposit_amt) AS total_deposits,
    SUM(withdrawal_amt) AS total_withdrawals,
    MAX(balance_amt) AS latest_recorded_balance
FROM transactions
GROUP BY account_id;