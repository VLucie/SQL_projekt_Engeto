-- Otazka 5:Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem? --

WITH 
price_wages AS(
SELECT
		year_food_price,
		round(avg(avg_price),1) AS avg_price,
		round(avg(avg_wages),0) AS avg_wages
FROM t_lucie_vackova_project_sql_primary_final tlvpspf 
GROUP BY year_food_price
ORDER BY year_food_price),

gdp_czech AS(
SELECT 
		round(gdp::numeric,0) AS mld_gdp,
		year
FROM t_lucie_vackova_project_sql_secondary_final
WHERE country = 'Czech Republic')

SELECT 
		price_wages.year_food_price AS YEAR,
		price_wages.avg_price,
		price_wages.avg_wages,
		gdp_czech.mld_gdp,
		round (((avg_price - LAG(avg_price) OVER (ORDER BY year_food_price))
    	/ LAG(avg_price) OVER (ORDER BY year_food_price)) * 100, 1) AS pct_increase_price,
    	round (((avg_wages - LAG(avg_wages) OVER (ORDER BY year_food_price))
    	/ LAG(avg_wages) OVER (ORDER BY year_food_price)) * 100, 1) AS pct_increase_wages,
    	round (((mld_gdp - LAG(mld_gdp) OVER (ORDER BY year_food_price))
    	/ LAG(mld_gdp) OVER (ORDER BY year_food_price)) * 100, 1) AS pct_increase_gdp
FROM price_wages 
JOIN gdp_czech
ON price_wages.year_food_price = gdp_czech.YEAR;



