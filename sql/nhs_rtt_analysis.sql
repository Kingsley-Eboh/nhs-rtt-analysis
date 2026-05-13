-- ============================================================
-- NHS RTT Waiting Times SQL Analysis 2025/26
-- Author: Kingsley Eboh
-- Data Source: NHS England Consultant-led RTT Waiting Times
-- Database: PostgreSQL 16
-- ============================================================


-- Query 1: National 18-Week Performance by Month
-- Monthly national performance was calculated by summing patients
-- within 18 weeks and total patients across all trusts and
-- specialties. The percentage was derived at the national level
-- so that larger trusts carried proportionally more weight.

SELECT 
    TO_CHAR(period_date, 'Mon YYYY') AS month,
    SUM(total_all) AS total_patients,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks
FROM rtt_waiting
GROUP BY period_date
ORDER BY period_date;


-- Query 2: Quarterly Performance Trend
-- Monthly figures were aggregated into NHS financial year quarters
-- to identify broader performance patterns across the year.
-- Q4 contained only two months as March 2026 had not been
-- published at the time of this analysis.

SELECT 
    quarter,
    SUM(total_all) AS total_patients,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks
FROM rtt_waiting
GROUP BY quarter
ORDER BY MIN(period_date);


-- Query 3: Total Waiting List Size by Month
-- The total number of patients on the incomplete pathway waiting
-- list was examined across all 11 months to assess whether the
-- overall backlog grew or reduced during the period.

SELECT 
    TO_CHAR(period_date, 'Mon YYYY') AS month,
    SUM(total_all) AS total_waiting
FROM rtt_waiting
GROUP BY period_date
ORDER BY period_date;


-- Query 4: Ten Worst Performing Specialties
-- The ten worst performing specialties by 18-week performance
-- were identified by aggregating performance across all trusts
-- and reporting periods.

SELECT 
    treatment_function_name,
    SUM(total_all) AS total_patients,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks
FROM rtt_waiting
GROUP BY treatment_function_name
ORDER BY pct_within_18wks ASC
LIMIT 10;


-- Query 5: Ten Worst Performing Trusts
-- Trusts with the lowest 18-week performance were identified.
-- Only trusts with a minimum of 1000 patients were included
-- to avoid results being distorted by very small providers.

SELECT 
    provider_org_name,
    SUM(total_all) AS total_patients,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks
FROM rtt_waiting
WHERE total_all >= 1000
GROUP BY provider_org_name
ORDER BY pct_within_18wks ASC
LIMIT 10;


-- Query 6: Ten Best Performing Trusts
-- Trusts with the highest 18-week performance were identified.
-- Only trusts with a minimum of 1000 patients were included
-- to avoid results being distorted by very small providers.

SELECT 
    provider_org_name,
    SUM(total_all) AS total_patients,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks
FROM rtt_waiting
WHERE total_all >= 1000
GROUP BY provider_org_name
ORDER BY pct_within_18wks DESC
LIMIT 10;


-- Query 7: Long Waiters by Month (52 Plus and 104 Plus Weeks)
-- Patients waiting longer than 52 weeks and longer than 104 weeks
-- were tracked monthly to assess whether the NHS was making
-- progress in clearing the longest waits across the period.

SELECT 
    TO_CHAR(period_date, 'Mon YYYY') AS month,
    SUM(waiters_52plus) AS waiters_52plus,
    SUM(waiters_104plus) AS waiters_104plus
FROM rtt_waiting
GROUP BY period_date
ORDER BY period_date;


-- Query 8: Ten Worst Performing ICBs
-- Performance was examined at the Integrated Care Board level
-- to identify which commissioning areas carried the greatest
-- patient waiting time risk across the reporting period.

SELECT 
    commissioner_parent_name,
    SUM(total_all) AS total_patients,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks
FROM rtt_waiting
WHERE commissioner_parent_name != 'Unknown'
AND total_all >= 1000
GROUP BY commissioner_parent_name
ORDER BY pct_within_18wks ASC
LIMIT 10;


-- Query 9: Performance Gap to 92% Target by Specialty
-- The gap between each specialty's 18-week performance and the
-- 92% NHS constitutional standard was calculated to quantify
-- the scale of underperformance across clinical areas.

SELECT 
    treatment_function_name,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks,
    ROUND(CAST(92 - SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS gap_to_target
FROM rtt_waiting
GROUP BY treatment_function_name
ORDER BY gap_to_target DESC
LIMIT 10;


-- Query 10: Month on Month Performance Change
-- The month on month change in 18-week performance was calculated
-- using the LAG window function to identify which months showed
-- the greatest improvement or deterioration across the period.

SELECT 
    TO_CHAR(period_date, 'Mon YYYY') AS month,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) AS pct_within_18wks,
    ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1) - 
    LAG(ROUND(CAST(SUM(patients_within_18wks) / SUM(total_all) * 100 AS NUMERIC), 1)) 
    OVER (ORDER BY period_date) AS month_on_month_change
FROM rtt_waiting
GROUP BY period_date
ORDER BY period_date;
