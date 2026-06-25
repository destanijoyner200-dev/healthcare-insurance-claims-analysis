-- Denial Rate
SELECT
COUNT(CASE WHEN Denial_Status = 'Denied' THEN 1 END) * 1.0 / COUNT(*) AS denial_rate
FROM claims;

-- Revenue Lost
SELECT
SUM(Claim_Amount - Approved_Amount) AS total_revenue_lost
FROM claims;

-- Denial Reasons
SELECT
Denial_Reason,
COUNT(*) AS total_denials
FROM claims
WHERE Denial_Status = 'Denied'
GROUP BY Denial_Reason
ORDER BY total_denials DESC;

-- Revenue Lost by Denial Reason
SELECT
Denial_Reason,
SUM(Claim_Amount - Approved_Amount) AS revenue_lost
FROM claims
WHERE Denial_Status = 'Denied'
GROUP BY Denial_Reason
ORDER BY revenue_lost DESC;

-- Denial Rate by Insurance Provider
SELECT
Insurance_Provider,
COUNT(CASE WHEN Denial_Status = 'Denied' THEN 1 END) * 1.0 / COUNT(*) AS denial_rate
FROM claims
GROUP BY Insurance_Provider
ORDER BY denial_rate DESC;
