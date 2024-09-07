
create table director(
	id serial primary key,
	name varchar(255)
);

create table films(
	id serial primary key,
	name varchar(255),
	position_id int references director(id)
);
insert into director(name) values ('Spilberg');
into films(name, position_id) VALUES ('JAWS', 1);

select * from films;
select * from director where id in (select position_id from films);

create table driver_license(
	id serial primary key,
	number int
);

create table people(
	id serial primary key,
	name varchar(255),
	driver_license_id int references driver_license(id) unique
);

create table investors(
	id serial primary key,
	name varchar(255)
);

create table stocks(
	id serial primary key,
	name varchar(255)
);

create table investors_stocks(
    id serial primary key,
    investor_id int references investors(id),
    stock_id int references stocks(id)
);