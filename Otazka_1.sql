--Otazka 1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? --

WITH increase AS(
SELECT 
		industry,
		payroll_year,
		round(avg(avg_wages)) AS average_wages
FROM  
	t_lucie_vackova_project_sql_primary_final tlvpspf 
GROUP BY 
		industry,
		payroll_year
ORDER BY 
		industry ASC,
		payroll_year ASC)

SELECT 	industry,
		payroll_year,
		average_wages,
		round(((average_wages * 100)/ LAG (average_wages) OVER (PARTITION BY industry ORDER BY payroll_year))-100,1) AS percent_increase
FROM 	increase;

