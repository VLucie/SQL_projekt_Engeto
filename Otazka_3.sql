--Otazka 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

WITH prices AS(
SELECT
		food_category,
		year_food_price,
		round(avg(avg_price),1) AS avg_price
FROM t_lucie_vackova_project_sql_primary_final tlvpspf 
GROUP BY food_category, year_food_price )

SELECT 
		food_category,
		year_food_price,
		avg_price
FROM prices
ORDER BY food_category, year_food_price;
