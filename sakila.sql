use sakila;
/*1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.*/
select cust.first_name as "Nombre",cust.last_name as "Apellido" ,cust.email,addr.address from customer cust
join address addr
on cust.address_id = addr.address_id
join city 
on addr.city_id = city.city_id
 where city.city_id=312;
 
/*2. ¿Qué consulta harías para obtener todas las películas de comedia? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales 
y el género (categoría).*/
select film.title as "Titulo",film.description as "Descripción",film.release_year as "Año de estreno",film.rating as"Calificación",film.special_features as "características especiales " from film_category filmcat
join category cat
on filmcat.category_id = cat.category_id
join film 
on filmcat.film_id = film.film_id
where cat.name="comedy";

/*3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y 
el año de lanzamiento.*/
select actor.actor_id ,concat(actor.first_name," ",actor.last_name) as "Actor_name",film.title,film.description,film.release_year from film_actor filac
join actor
on filac.actor_id = actor.actor_id
join film
on filac.film_id= film.film_id
where actor.actor_id=5;

/*4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.*/
select c.first_name,c.last_name,c.email,address.address from customer c 
join store
 on c.store_id=store.store_id
 join address 
 on c.address_id = address.address_id
 join city
 on address.city_id=city.city_id
 where store.store_id=1
 and city.city_id in (1, 42, 312, 459);
 /*5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? 
 Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. 
 Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.*/
 select  film.title,film.description,film.release_year,film.rating,film.special_features from film_actor
join actor
on film_actor.actor_id = actor.actor_id
join film
on film_actor.film_id= film.film_id
where film.rating="G" and film.special_features like "%behind the scenes%" and actor.actor_id=15;
/*6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
Su consulta debe devolver film_id, title, actor_id y actor_name.*/
select film.film_id,film.title,actor.actor_id,concat(actor.first_name," ",actor.last_name) as "Nombre" from film_actor 
join actor 
on film_actor.actor_id = actor.actor_id
join film 
on film_actor.film_id= film.film_id
where film_actor.film_id=369; 

/*7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).*/
select film.title,film.description,film.release_year,film.rating,film.special_features,category.name from film_category
join category
on film_category.category_id = category.category_id
join film
on film_category.film_id = film.film_id
where category.name="drama" and film.rental_rate=2.99; 

/*8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales, el género (categoría) y el nombre y apellido del actor.*/
select film.title,film.description,film.release_year,film.rating,film.special_features,category.name,concat(actor.first_name," ",actor.last_name) as "Nombre" from film_actor
join actor on film_actor.actor_id = actor.actor_id
join film on film_actor.film_id = film.film_id 
join film_category on film.film_id= film_category.film_id
join category on film_category.category_id = category.category_id
where actor.first_name="sandra" and actor.last_name="kilmer" and category.name="action";
