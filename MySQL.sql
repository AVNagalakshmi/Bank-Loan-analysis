USE bank;

SELECT 
    *
FROM
    finance_1;
    
SELECT 
    *
FROM
    finance_2;

-- -------------------______________________  YEAR WISE LOAN AMOUNT STATUS ______________--------------------------------------------------------------

SELECT 
    YEAR(STR_TO_DATE(f1.issue_d, '%b-%y')) AS year,
    SUM(f1.loan_amnt) AS total_loan_amount,
	AVG(loan_amnt) AS average_loan_amount,
    COUNT(loan_amnt) AS loan_count, loan_status
FROM
    finance_1 f1
GROUP BY year
ORDER BY year;

-- ----------------___________________ GRADE AND SUB_GRADE WISE REVOL_BALENCE _____________________--------------------------------------------------

SELECT 
    f1.grade, f1.sub_grade, SUM(f2.revol_bal) AS total_revol_bal
FROM
    finance_1 f1
        JOIN
    finance_2 f2 ON f1.id = f2.id
GROUP BY f1.grade , f1.sub_grade
ORDER BY f1.grade , f1.sub_grade;

-- ----------________________ TOTAL PAYMENT FOR VERIFIED AND NON VERIFIED STATUS __________________----------------------------------------

SELECT 
    f1.verification_status, SUM(f2.total_pymnt) AS total_payment
FROM
    finance_1 f1
        JOIN
    finance_2 f2 ON f1.id = f2.id
GROUP BY f1.verification_status;
    
-- ----------------______________ STATE WISE AND MONTH WISE LOAN STATUS ________________-----------------------------------------------------

SELECT 
    addr_state,
    DATE_FORMAT(STR_TO_DATE(issue_d, '%b-%y'), '%Y-%m') AS issue_month,
    loan_status
FROM
    finance_1
GROUP BY addr_state , issue_month , loan_status
ORDER BY addr_state , issue_month , loan_status;
    
-- ---------------------_________________  HOME OWNERSHIP VS LAST PAYMENT DATE STATUS _______________-----------------------

SELECT 
    f1.home_ownership,
    MAX(STR_TO_DATE(f2.last_pymnt_d, '%b-%y')) AS last_payment_date
FROM
    finance_1 f1
        JOIN
    finance_2 f2 ON f1.id = f2.id
GROUP BY f1.home_ownership
ORDER BY f1.home_ownership;