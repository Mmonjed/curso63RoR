-- Usando el siguiente ERD como referencia, escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.

select * from  friendships; -- user_id, friend_id
select * from users; 

select concat(users.first_name," ",users.last_name)as Nombre,  concat(users2.first_name, " ",users2.last_name) as Amigos 
from users
inner join friendships on friendships.user_id = users.id
inner join users as users2 on users2.id = friendships.friend_id;

-- 1 Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.

select * from users
where first_name = 'kermit'; -- id 4

select concat(users2.first_name, " ",users2.last_name) as Amigo, concat(users.first_name," ",users.last_name)as Usuarios 
from users
inner join friendships on friendships.user_id = users.id
inner join users as users2 on users2.id = friendships.friend_id
where users2.id= 4;

-- 2 Devuelve el recuento de todas las amistades.

select concat(users.first_name, "  ",users.last_name) as Usuarios, count(users.first_name) as Cantidad_amigos
from friendships
inner join users on users.id = friendships.user_id 
group by users.first_name, users.last_name; 

-- 3 Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

select concat(users.first_name, "  ",users.last_name) as Usuarios, count(users.first_name) as Cantidad_amigos
from friendships
inner join users on users.id = friendships.user_id 
group by users.first_name, users.last_name;

-- 4 Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.

select * from users;
INSERT INTO users (id, first_name,last_name,created_at) VALUES ('6', 'Monica', 'Monje', '2021-07-07 18:22:10');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('7', '6', '2', '2021-07-07 18:30:05');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('8', '6', '4', '2021-07-07 18:30:05');
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('9', '6', '5', '2021-07-07 18:30:05');
select * from  friendships;

select concat(users.first_name," ",users.last_name)as Nombre,  concat(users2.first_name, " ",users2.last_name) as Amigos 
from users
inner join friendships on friendships.user_id = users.id
inner join users as users2 on users2.id = friendships.friend_id;

-- 5 Devuelve a los amigos de Eli en orden alfabético.

select * from users; 

select concat(users2.first_name, " ",users2.last_name) as Amigo, concat(users.first_name," ",users.last_name)as Usuarios 
from users
inner join friendships on friendships.user_id = users.id
inner join users as users2 on users2.id = friendships.friend_id
where users2.id= 2
order by Usuarios asc;

-- Eliminar a Marky Mark de los amigos de Eli.