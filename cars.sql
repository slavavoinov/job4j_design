
create table car_bodies
(
	id serial primary key,
	name varchar(255)
);
create table car_engines
(
	id serial primary key,
	name varchar(255)
);
create table car_transmissions
(
	id serial primary key,
	name varchar(255)
);
create table cars
(
	id serial primary key,
	name varchar(255),
    body_id int references car_bodies(id),
    engine_id int references car_engines(id),
    transmission_id int references car_transmissions(id)
);

insert into car_bodies (name) values ('седан'), ('хэтчбек'), ('пикап'), ('универсал'), ('минивэн'), ('кабриолет');
insert into car_engines (name) values ('бензиновый'), ('дизельный'), ('газовый'), ('рядный'), ('оппозитный'), ('ротационный'), ('турбированный');
insert into car_transmissions (name) values ('механика'), ('автомат'), ('робот'), ('вариатор');

insert into cars (name, body_id, engine_id, transmission_id) values ('Volkswagen', 1, 1, 1);
insert into cars (name, body_id, engine_id, transmission_id) values ('Volvo', 1, 7, 1);
insert into cars (name, body_id, engine_id, transmission_id) values ('Mersedes', 1, null, null);
insert into cars (name, body_id, engine_id, transmission_id) values ('Mazda', null, 2, 2);
insert into cars (name, body_id, engine_id, transmission_id) values ('Москвич', 1, 7, null);
insert into cars (name, body_id, engine_id, transmission_id) values ('Geely', 6, null, 3);

select car.id, car.name, body.name, eng.name, transm.name 
    from cars car
    left join car_bodies body on car.body_id = body.id
    left join car_engines eng on car.engine_id = eng.id
    left join car_transmissions transm on car.transmission_id = transm.id;

select body.name from car_bodies body
    left join cars car on car.body_id = body.id
    where car.name is null;

select eng.name from car_engines eng
    left join cars car on car.engine_id = eng.id
    where car.name is null;

select transm.name from car_transmissions transm
    left join cars car on car.transmission_id = transm.id
    where car.name is null;