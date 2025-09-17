-- Tabulka 1 --

WITH avg_wages_year_industry AS (
	SELECT 
		cpay.payroll_year,
		cpib.name AS industry,
		avg(cpay.value) AS average_wages
	FROM 
		czechia_payroll cpay
	JOIN czechia_payroll_industry_branch cpib
		ON cpay.industry_branch_code = cpib.code 
	JOIN czechia_payroll_calculation cpc 
		ON cpay.calculation_code = cpc.code
		AND cpay.calculation_code = 100
		AND cpay.value_type_code = 5958
	GROUP BY cpay.payroll_year, 
			 cpib."name"),
avg_prices_year_food AS (
	SELECT 
		cpc.name AS food_category,
		EXTRACT (YEAR FROM cp.date_from) AS year_food_price,
		avg(cp.value) AS average_price
	FROM czechia_price cp 
	JOIN czechia_price_category cpc 
		ON cp.category_code = cpc.code
		AND cp.region_code IS NULL
	GROUP BY cpc.name,
			 EXTRACT (YEAR FROM cp.date_from)) 
			 
SELECT
	avg_w.industry,
	avg_w.payroll_year,
	round(avg_w.average_wages) AS avg_wages,
	avg_p.food_category,
	avg_p.year_food_price,
	round(avg_p.average_price::NUMERIC,2) AS avg_price
FROM avg_wages_year_industry AS avg_w
JOIN avg_prices_year_food AS avg_p
    ON avg_w.payroll_year = avg_p.year_food_price
ORDER BY
	avg_w.payroll_year ASC,
	avg_p.food_category ASC,
	avg_w.industry ASC;