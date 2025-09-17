--Otazka 2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? --

WITH prices_06_18 AS(
SELECT DISTINCT 
		food_category,
		year_food_price,
		avg_price
FROM t_lucie_vackova_project_sql_primary_final tlvpspf 
WHERE food_category IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
		AND year_food_price IN (2006, 2018)),
avg_wages_06_18 AS(
SELECT 
		payroll_year,
		round(avg(avg_wages),0) AS prumer_all_industry
FROM t_lucie_vackova_project_sql_primary_final tlvpspf 
WHERE  payroll_year  IN (2006, 2018)
GROUP BY payroll_year
ORDER BY payroll_year)

SELECT 
		wages.payroll_year,
		prices.food_category,
		wages.prumer_all_industry,
		prices.avg_price,
		round((wages.prumer_all_industry/prices.avg_price),0) AS kg_liters_per_year
FROM prices_06_18 AS prices
JOIN avg_wages_06_18 AS wages
ON prices.year_food_price = wages.payroll_year;


