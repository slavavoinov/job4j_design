create table departments
(
id serial primary key,
	name text
);
create table employees
(
	id serial primary key,
	name text,
    departments_id int references departments(id)
);
insert into departments(name) values ('Логистика'), ('Склад'), ('Производство'), ('Экономический');

insert into employees(name, departments_id) values ('Иванов Иван', 1);
insert into employees(name, departments_id) values ('Петров Петр', 2);
insert into employees(name, departments_id) values ('Филлимонов Олег', 3);
insert into employees(name, departments_id) values ('Курчатов Сергей', 3);
insert into employees(name, departments_id) values ('Сидоров Сергей', 2);
insert into employees(name, departments_id) values ('Капустин Борис', 2);
insert into employees(name, departments_id) values ('Мартынов Альберт', 1);
insert into employees(name, departments_id) values ('Шошин Владимир', 2);
insert into employees(name, departments_id) values ('Шитиков Виктор', null);

select * from employees e
left join departments d on e.departments_id = d.id;

select * from departments d
right join employees e on e.departments_id = d.id;

select * from employees e
full join departments d on e.departments_id = d.id;

select * from employees e
cross join departments d;

select * from departments d
left join employees e on e.departments_id = d.id
where e.name is null;

select * from employees e
left join departments d on e.departments_id = d.id
where d.name is not null;

select * from employees e
right join departments d on e.departments_id = d.id
where e.name is not null;

create table teens
(
    name text,
    gender text
);

insert into teens(name, gender) values ('Вася', 'man');
insert into teens(name, gender) values ('Вита', 'woman');
insert into teens(name, gender) values ('Петя', 'man');
insert into teens(name, gender) values ('София', 'woman');

select t1.name, t2.name from teens t1 cross join teens t2 where t1.gender = 'man' and t2.gender = 'woman';

