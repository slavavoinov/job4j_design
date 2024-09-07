create table school(
	id serial primary key,
	name varchar(255),
	age int,
	male boolean,
	area text
);

insert into school(name, age, male) values('Иван','7','true');

update school set name = 'Петр';

delete from school;

