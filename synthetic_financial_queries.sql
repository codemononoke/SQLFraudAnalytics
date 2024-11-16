SELECT * FROM transactions;

-- SQL Queries for Analyzing Synthetic Financial Transaction

-- Question 1) Identify the total number of transactions by type?
SELECT
	type,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY type
ORDER BY total_transactions DESC;

-- Question 2) Find the total amount transacted for each transaction type?
SELECT
	type,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY type
ORDER BY total_amount DESC;

-- Question 3) Calculate average transaction amount by type?
SELECT
	type,
    ROUND(AVG(amount), 2) as avg_amount
FROM transactions
GROUP BY type
ORDER BY avg_amount DESC;

-- Question 4) Find top 10 transactions by amount?
SELECT *
FROM transactions
ORDER BY amount DESC LIMIT 10;

-- Question 5) Detect suspicious high-value transactions?
SELECT * 
FROM transactions
WHERE amount > 200000;

-- Question 6) Count number of fraudulent transactions?
SELECT
	COUNT(*) as total_fraudulent_transactions
FROM transactions
WHERE isFraud = 1;

-- Question 7) Analyze fraud rate by transaction type?
-- Create a new table to store pre-aggregated counts:
CREATE TABLE transaction_counts AS
SELECT type, COUNT(*) AS total_type_count
FROM transactions
GROUP BY type;
-- -------------------------------------------------------------
SELECT
    t.type,
    COUNT(*) AS total_fraud,
    (COUNT(*) * 100.0 / tc.total_type_count) AS fraud_rate
FROM transactions t
JOIN transaction_counts tc ON t.type = tc.type
WHERE t.isFraud = 1
GROUP BY t.type, tc.total_type_count
ORDER BY fraud_rate DESC;

-- Question 8) Determine the average old balance for fraudulent transactions?
SELECT
	ROUND(AVG(oldbalanceOrg), 2) AS avg_old_balance_fraud
FROM transactions
WHERE isFraud = 1;

-- Question 9) Identify transactions with zero balance after payment?
SELECT *
FROM transactions
WHERE newbalanceOrig = 0;

-- Question 10) Analyze high-risk accounts by total fraudulent amounts?
SELECT 
	nameOrig,
    SUM(amount) AS total_fraud_amount
FROM transactions 
WHERE isFraud = 1
GROUP BY nameOrig
ORDER BY total_fraud_amount DESC;

-- Question 11) Identify recipients with unusual balance changes?
SELECT
	nameDest,
    COUNT(*) AS unusual_balance_count
FROM transactions
WHERE oldbalanceDest = 0 AND newbalanceDest > 0
GROUP BY nameDest
ORDER BY unusual_balance_count DESC;

-- Question 12) Correlation analysis of fraudulent transactions and flagged transactions?
SELECT
	COUNT(*) AS flagged_and_fraud_count
FROM transactions
WHERE isFraud = 1 AND isFlaggedFraud = 1;

-- Question 13) Detect large transactions with zero initial balance?
SELECT *
FROM transactions
WHERE oldbalanceOrg = 0 AND amount > 100000;






