# SQL_projekt_Engeto
Porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

## Popis projektu
Tento projekt byl vypracován v rámci kurzu Datová akademie od Engeto.
Z veřejně dostupných dat byly vytvořeny dvě tabulky. 
Tabulka 1 **t_lucie_vackova_project_sql_primary_final** obsahuje data mezd a cen potravin za Českou republiku.
Tabulka 2 **t_lucie_vackova_project_sql_secondary_final** obsahuje dodatečná data o dalších evropských státech.
Tabulky obsahují data z období let 2006-2018.
Z vytvořených tabulek byly získány odpovědi na výzkumné otázky.

## Tvorba tabulky 1
Tabulka byla vytvořena sjednocením tabulek czechia_payroll a czechia_price.
Tabulky byly spojeny přes porovnávané období tj. roky 2006-2018.
Pro každý rok a každé odvětví jsou v tabulce uvedeny
•	měsíční průměrná mzda v daném odvětví,
•	průměrná cena každé kategorie potraviny.
Pro výpočet průměrné mzdy byla použita fyzická mzda, která se nepřepočítává a tudíž odpovídá reálným příjmům osob.
Průměrná mzda za daný rok byla vypočítána jako průměr měsíčních mezd ze všech kvartálů toho roku.
Průměrná roční cena potravin byla stanovena jako průměr cen ze všech měřených období během daného roku.
Regiony byly filtrovány na null, aby ceny byly celostátní a nebyly rozděleny podle regionů.

## Tvorba tabulky 2
Tabulka byla vytvořena z tabulek countries a economies.
Z tabulky countries byly vyfiltrovány pouze evropské země. 
Z tabulky economies byly vyfiltrovány informace o hdp, populaci a gini indexu pouze v porovnávaných letech 2006 – 2018. Tabulky byly spojeny přes název země.

## Otázka 1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Přepočítané průměrné mzdy ve všech odvětvích ve sledovaném období měly růstový trend. Navýšení průměrných mezd od roku 2006 do roku 2018 bylo v průměru o 58,7 %. Nejméně vzrostly mzdy v peněžnictví a pojišťovnictví  (o 35,5 %), nejvíce vzrostly mzdy ve zdravotní a sociální péči (o 76,0 %). Byly pozorovány nepatrné výkyvy, které se týkaly převážně poklesu průměrné mzdy z roku 2012 na rok 2013. Jednalo se o krátkodobou nestabilitu

## Otázka 2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

Rok **2006** : 
Chléb konzumní kmínový   	  	1262 kg za rok
Mléko polotučné pasterované	  1409	l za rok
Rok **2018**:
Chléb konzumní kmínový	     	1319	kg za rok
Mléko polotučné pasterované		1614	 l za rok

V roce 2018 si bylo možné z průměrné mzdy koupit o 4,5% více chleba a o 14,5% více mléka.

## Otázka 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
Od roku 2006 do roku 2018 nejvíce zdražilo máslo o 98,4%. Naopak cukr krystal zlevnil o 27,2%. U jakostního bílého vína nelze vývoj v celém pozorovaném období určit z důvodu nedostatku dat.

## Otázka 4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
V žádném roce nedošlo k výrazně vyššímu nárůstu cen potravin oproti mzdám (o více než 10%). Nejvyšší meziroční nárůst cen potravin vůči mzdám byl v roce 2013 a to o 6,8%.

## Otázka 5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?



