/* Project conducted in PostgreSQL */

/*Observing the dataset */
Select *
FROM international_debt
Limit 10;

/* Distinct Countries */

SELECT COUNT(DISTINCT(country_name)) AS total_distinct_countries
FROM international_debt;

/* Debt Owned by countries */

SELECT ROUND(SUM(debt)/1000000, 2) as total_debt
FROM international_debt;

/* Countries with highest debt */

SELECT country_name, SUM(DEBT) as total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt desc
LIMIT 1;

/* Average debt across indicators */

SELECT indicator_code AS debt_indicator,indicator_name, AVG(debt) as average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt desc
LIMIT 10;

/* Highest principle amounts */

SELECT country_name, indicator_name
FROM international_debt
WHERE debt = (SELECT
                 MAX(debt)
                 FROM international_debt
                 WHERE indicator_code='DT')
                 
/* Most common debt indicator */

SELECT indicator_code, COUNT(indicator_code) as indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count desc, indicator_code DESC
LIMIT 20;
