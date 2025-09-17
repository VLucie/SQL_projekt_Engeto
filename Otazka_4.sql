--Otazka 4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? --

WITH 
year_avg AS(
SELECT
		year_food_price,
		round(avg(avg_price),1) AS avg_price,
		round(avg(avg_wages),1) AS avg_wages
FROM t_lucie_vackova_project_sql_primary_final tlvpspf 
GROUP BY year_food_price
ORDER BY year_food_price)

SELECT
		year_food_price,
		round (((avg_price - LAG(avg_price) OVER (ORDER BY year_food_price))
    		/ LAG(avg_price) OVER (ORDER BY year_food_price)) * 100, 1) AS percent_increase_price,
    	round (((avg_wages - LAG(avg_wages) OVER (ORDER BY year_food_price))
    		/ LAG(avg_wages) OVER (ORDER BY year_food_price)) * 100, 1) AS percent_increase_wages,
    	round (((avg_price - LAG(avg_price) OVER (ORDER BY year_food_price))
    		/ LAG(avg_price) OVER (ORDER BY year_food_price)) * 100, 1) - 
    	round (((avg_wages - LAG(avg_wages) OVER (ORDER BY year_food_price))
    		/ LAG(avg_wages) OVER (ORDER BY year_food_price)) * 100, 1) AS difference
FROM year_avg
ORDER BY year_food_price;