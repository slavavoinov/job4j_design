create table products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

insert into products (name, producer, count, price)
VALUES ('product_1', 'producer_1', 3, 50);
insert into products (name, producer, count, price)
VALUES ('product_2', 'producer_2', 15, 32);
insert into products (name, producer, count, price)
VALUES ('product_3', 'producer_3', 8, 115);
insert into products (name, producer, count, price)
VALUES ('product_4', 'producer_4', 11, 64);
insert into products (name, producer, count, price)
VALUES ('product_5', 'producer_5', 17, 45);

begin transaction;
insert into products (name, producer, count, price) VALUES ('product_6', 'producer_6', 13, 55);
savepoint first_savepoint;
delete from products where price = 115;
update products set price = 75 where name = 'product_1';
select * from products;
rollback to first_savepoint;
select * from products;
commit transaction;

begin transaction;
insert into products (name, producer, count, price) VALUES ('product_7', 'producer_7', 12, 53);
insert into products (name, producer, count, price) VALUES ('product_8', 'producer_8', 11, 52);
savepoint second_savepoint;
delete from products where price = 115;
update products set price = 75 where name = 'product_1';
select * from products;
rollback to second_savepoint;
select * from products;
commit transaction;