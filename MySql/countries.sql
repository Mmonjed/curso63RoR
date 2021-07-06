-- ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)

use world;

select * from cities;
select * from countries;
select * from languages;

select language, percentage from languages where language LIKE '%sloven%' order by percentage desc;

select name from countries where id in (200,107,96,16);

select  cn.name, lgg.language, lgg.percentage from languages lgg
INNER JOIN countries cn ON lgg.country_id = cn.id
where lgg.language LIKE '%sloven%' 
order by lgg.percentage desc;

select  name,language, percentage from languages
INNER JOIN countries ON languages.country_id = countries.id
where countries.id in (200,107,96,16)
order by percentage desc;
select * from cities;
select * from countries;
select * from languages; 



-- ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)

select * from countries cou; 
select * from countries
where name= 'chile';  -- chl, id 41

select * from cities cit
where country_code = 'chl';

select district, COUNT(*)
from cities
where country_code = 'chl' 
group by district;

select  cou.name, cou.continent, COUNT(cit.name)
from cities cit, countries cou
where cit.country_id = cou.id
group by cou.name, cou.continent
order by COUNT(cit.name) desc;

select countries.name, count(countries.name) total 
from cities
INNER JOIN countries ON cities.country_id = countries.id
group by countries.name
order by total desc;


--  ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? Tu consulta debe organizar el resultado por población en orden descendente. (1)

select * from countries; 
select * from countries cou 
where cou.name like '%ico%'; -- id 136

select * from cities cit
where country_id= 136;

select * from cities cit
where country_id = 136
and cit.population > '500000' 
order by cit.population desc; 

-- ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)

select * from languages;

select cou.id, cou.name, lan.language, lan.percentage 
from countries cou, languages lan
where lan.country_id = cou.id
and lan.percentage > '89'
order by lan.percentage desc;

select countries.name, languages.language, languages.percentage from languages
INNER JOIN countries ON countries.id = languages.country_id
where percentage >89
order by languages.percentage desc;

select ct.name nombre, lg.language lenguaje, lg.percentage porcentaje from languages lg
INNER JOIN countries ct ON ct.id = lg.country_id
where lg.percentage >89
order by lg.percentage desc
;

-- ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)

select * from countries; 

select id, name, surface_area, population
from countries
where surface_area <'501' and population >'100000'
order by surface_area asc;

-- ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)

select * from countries cou
where cou.government_form like '%monar%';

select id, name, government_form, capital, life_expectancy
from countries cou
where government_form= 'Constitutional Monarchy' and capital >'200' and life_expectancy >'75'
order by life_expectancy desc;  

--  ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)

select * from countries; 

select * from cities cit
where district= 'buenos aires' and population >'500000';

select cou.name,  cit.name, cit.district, cit.population
from countries cou, cities cit
where cou.id=9 and cit.district='buenos aires' and cit.population >'500000'
order by cit.population;

select  countries.name pais, cities.name ciudad, cities.district distrito, cities.population poblacion
from cities
INNER JOIN countries ON countries.id = cities.country_id
where cities.country_id = 9
and cities.district = 'Buenos Aires'
and cities.population > 500000;

-- 8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)

select * from countries; 

select * from countries cou
where region= 'south america';

SELECT COUNT(region) FROM countries cou
where cou.region= 'south america'; 

select region, COUNT(*)
from countries
where continent = 'south america' 
group by region desc; 
	
select region, COUNT(*)
from countries
group by region 
order by count(*) desc; 


