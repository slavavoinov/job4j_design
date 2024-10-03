CREATE TABLE customers
(
    id         serial primary key,
    first_name text,
    last_name  text,
    age        int,
    country    text
);
insert into customers (first_name, last_name, age, country) 
values('Иван', 'Иванов', 35, 'Argentina');
insert into customers (first_name, last_name, age, country) 
values('Петр', 'Петров', 37, 'USA');
insert into customers (first_name, last_name, age, country) 
values('Сидор', 'Сидоров', 25, 'Russia');
insert into customers (first_name, last_name, age, country) 
values('Николай', 'Николаев', 27, 'France');
insert into customers (first_name, last_name, age, country) 
values('Григорий', 'Лепс', 23, 'England');
select * from customers where age = (select min(age) from customers);

CREATE TABLE orders
(
    id          serial primary key,
    amount      int,
    customer_id int references customers (id)
);
insert into orders (amount, customer_id) 
values(300, 1);
insert into orders (amount, customer_id) 
values(350, 2);
select * from customers where customers.id not in (select customer_id from orders);