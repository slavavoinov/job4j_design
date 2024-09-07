create table devices
(
    id    serial primary key,
    name  varchar(255),
    price float
);

create table people
(
    id   serial primary key,
    name varchar(255)
);

create table devices_people
(
    id        serial primary key,
    device_id int references devices (id),
    people_id int references people (id)
);

insert into devices(name, price) values ('Iphone', 80000), ('Macbook', 100000), ('Yandex mini', 4000);
insert into people(name) values ('Аня'), ('Ваня'), ('Боря'); 
insert into devices_people(people_id, device_id) values (1, 1), (1, 2);
insert into devices_people(people_id, device_id) values (2, 1), (2, 3);
insert into devices_people(people_id, device_id) values (3, 3);

select avg(price) from devices;

select p.name, avg(dev.price)
from people as p
         inner join devices_people as dp
              on dp.people_id = p.id
			  inner join devices as dev on
			  dp.device_id = dev.id
			  group by p.name;

select p.name, avg(dev.price)
from people as p
         inner join devices_people as dp
              on dp.people_id = p.id
			  inner join devices as dev on
			  dp.device_id = dev.id
			  group by p.name
			  having avg(dev.price) > 5000;