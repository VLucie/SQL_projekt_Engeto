-- Tabulka 2 --

WITH 
europe_countries AS (
SELECT 
	countries.country 
FROM countries
WHERE continent = 'Europe'),
economies_years AS(
SELECT 
	country,
	"year",
	population,
	gdp,
	gini	
FROM economies
WHERE economies.YEAR BETWEEN 2006 AND 2018)

SELECT 
	ec.country,
	ey."year",
	ey.population,
	ey.gdp,
	ey.gini
FROM europe_countries AS ec
JOIN economies_years AS ey
	ON ec.country = ey.country
ORDER BY ec.country ASC, ey."year" ASC;
	

	