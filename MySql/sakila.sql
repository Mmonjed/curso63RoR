-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

use sakila;

select * from customer;
select * from address;
select * from city;

-- filtrar
select * from address 
where city_id = 312;

select * from customer
where address_id in (256,517);

-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select concat(customer.first_name, " " ,customer.last_name) as nombre, customer.email, address.address direccion from customer
INNER JOIN address ON address.address_id = customer.address_id
where address.address_id in (256,517);

--  ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

select * from category; -- id 5
select * from film; 
select * from film_category; -- category_id

select * from film_category
where category_id =5;

select  film.title pelicula, film.description descripcion, film.release_year lanzamiento, film.rating calificacion, film.special_features caracteristicas_especiales, category.name genero
from film_category
INNER JOIN film ON film_category.film_id = film.film_id
INNER JOIN category ON film_category.category_id = category.category_id 
where category.category_id = 5;

-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

select * from film; 
select * from actor; -- id 5 nombre actor> actor_id first_name, last_name
select * from film_actor; -- actor_id, film_id

select actor.actor_id, concat(actor.first_name, "  ",actor.last_name) as Nombre, film.title pelicula, film.description descripcion, film.release_year lanzamiento
from film_actor
INNER JOIN film ON film.film_id = film_actor.film_id
inner join actor on actor.actor_id = film_actor.actor_id
where actor.actor_id =5; 

-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select * from customer; -- customer_id, store_id
select * from city -- city_id 
where city_id in (1,42,312,459); 
select * from address; --  addess_id, city_id

select customer.store_id, city.city_id, concat(customer.first_name, "  " ,customer.last_name) as Nombre, customer.email, address.address direccion
from address
INNER JOIN customer  ON customer.address_id= address.address_id
INNER JOIN city ON city.city_id= address.city_id
where customer.store_id=1 and city.city_id in (1,42,312,459);

-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

select * from film; --  film_id ---- rating = G, special_features = 'Behind the Scenes'
select * from actor;  -- actor_id = 15
select * from  film_actor; -- actor_id, film_id

select * from film
where special_features like '%behind%';

select actor.actor_id, film.title pelicula, film.description descripcion, film.release_year lanzamiento, film.rating calificacion, film.special_features funcion_especial 
from film_actor
inner join actor on actor.actor_id = film_actor.actor_id
inner join film on film.film_id = film_actor.film_id
where actor.actor_id = 15 and film.rating= 'G' and film.special_features like  '%Behind the Scenes%';

-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? Su consulta debe devolver film_id, title, actor_id y actor_name.

select * from film; 
select * from actor;
select * from film_actor; 

select actor.actor_id, concat(actor.first_name,"  " ,actor.last_name) as nombre_actor, film.film_id, film.title pelicula 
from film_actor
inner join actor on actor.actor_id = film_actor.actor_id
inner join film on film.film_id = film_actor.film_id
where film.film_id = 369; 

-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

select * from film; -- film_id,  rental_rate= 2.99, title, description, release_year, rating, special_features,
select * from category; -- category_id, name, ='Drama'
select * from film_category; -- film_id, category_id

select film.title pelicula, film.description descripcion, film.release_year lanzamiento, film.rating calificacion, film.special_features caracteristicas_especiales, film.rental_rate tarifa, category.name categoria
from film_category
inner join film on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
where film.rental_rate= 2.99 and category.name ='Drama';

-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor.

select * from actor -- actor_id
where first_name = 'sandra'; -- id 23, first_name, last_name

select * from film; -- film_id, title,description,release_year,rating,special_features
select * from category; -- category_id, name
select * from film_category; -- une categoria con film-- film_id, category_id
select * from film_actor; -- une actor con film -- actor_id, film_id

select  film.title pelicula, film.description descripcion, film.release_year lanzamiento, film.rating calificacion, film.special_features caracteristicas_especiales, category.name genero 
from film_category
inner join film on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
 inner join (select actor.actor_id, actor.first_name nombre_actor, actor.last_name apellido_actor
from film_actor
inner join actor on actor.actor_id = film_actor.actor_id
inner join film on film.film_id = film_actor.film_id);


select  film.title pelicula, film.description descripcion, film.release_year lanzamiento, film.rating calificacion, film.special_features caracteristicas_especiales, actor.actor_id, concat(actor.first_name, "  " ,actor.last_name) as Nombre_actor
from  film, category, film_category, actor, film_actor
where  film.film_id = film_category.film_id
and category.category_id = film_category.category_id
and actor.actor_id = film_actor.actor_id
and film.film_id = film_actor.film_id
and actor.actor_id = 23
order by film.title asc;
                   

