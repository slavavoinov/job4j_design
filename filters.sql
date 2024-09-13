create table type
(
	id serial primary key,
	name text
);
create table product
(
    id serial primary key,
    name text,
    type_id int references type(id),
    expired_date date,
    price float
);

insert into type(name) values
('СЫР'), ('МОЛОКО'), ('МОРОЖЕНОЕ'), ('АЛКОГОЛЬ'), ('ХЛЕБ'); 

insert into product(name, type_id, expired_date, price) values
('Сыр сметанковый', 1, '20.09.2024', 20);
insert into product(name, type_id, expired_date, price) values
('Сыр с плесенью', 1, '25.09.2024', 200);
insert into product(name, type_id, expired_date, price) values
('Сыр Масдам', 1, '27.09.2024', 300);
insert into product(name, type_id, expired_date, price) values
('Кефир', 2, '24.06.2024', 80);
insert into product(name, type_id, expired_date, price) values
('Молоко пастеризованное', 2, '30.06.2024', 100);
insert into product(name, type_id, expired_date, price) values
('Ряженка', 2, '26.06.2024', 80);
insert into product(name, type_id, expired_date, price) values
('Фруктовый лед', 3, '01.12.2024', 35);
insert into product(name, type_id, expired_date, price) values
('Мороженое "Рожок"', 3, '02.12.2024', 40);
insert into product(name, type_id, expired_date, price) values
('мороженое "Лакомка"', 3, '03.12.2024', 45);
insert into product(name, type_id, expired_date, price) values
('Столичная', 4, '01.07.2027', 100);
insert into product(name, type_id, expired_date, price) values
('"Смирнoff"', 4, '03.07.2028', 200);
insert into product(name, type_id, expired_date, price) values
('"Red Label"', 4, '04.07.2028', 300);
insert into product(name, type_id, expired_date, price) values
('Хлеб "Волжский"', 5, '28.09.2024', 20);
insert into product(name, type_id, expired_date, price) values
('Хлеб "Бородинский"', 5, '29.09.2024', 30);
insert into product(name, type_id, expired_date, price) values
('Хлеб цельнозерновой', 5, '30.09.2024', 50);

select p.name, t.name
from product p join type t on p.type_id = t.id
where t.name = 'СЫР'; 

select * from product where name like '%мороженое%';

select * from product where expired_date < current_date;

select * from product where price = (select max(price) from product);

select t.name, count(p.type_id)
from product p join type t on p.type_id = t.id
group by t.name;

select p.name
from product p join type t on p.type_id = t.id
where t.name = 'СЫР' or t.name = 'МОЛОКО';

select t.name from type t where t.id < 10;
