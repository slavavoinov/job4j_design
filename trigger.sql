create table products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

insert into products (name, producer, count, price)
VALUES ('product_3', 'producer_3', 8, 120);

create
or replace function tax()
    returns trigger as
$$
    BEGIN
        update products
        set price = price + price * 0.2
        where id = (select id from inserted);
        return new;
    END;
$$
LANGUAGE 'plpgsql';

create trigger tax_trigger
    after insert
    on products
    referencing new table as
                    inserted
    for each statement
    execute procedure tax();

insert into products (name, producer, count, price)
VALUES ('product_1', 'producer_1', 3, 50);

select * from products;

create
or replace function tax_2()
    returns trigger as
$$
    BEGIN        
        new.price = new.price + new.price * 0.2;        
        return NEW;
    END;
$$
LANGUAGE 'plpgsql';

create trigger tax_2
    before insert
    on products
    for each row
    execute procedure tax_2();

create table history_of_price
(
    id    serial primary key,
    name  varchar(50),
    price integer,
    date  timestamp
);

create
or replace function save_history_to_table()
    returns trigger as
$$
    BEGIN
        insert into history_of_price
        (name, price, date)
        values(new.name, new.price, current_date);
        return NEW;
    END;
$$
LANGUAGE 'plpgsql';

create trigger save_history
    after insert
    on products
    for each row
    execute procedure save_history_to_table();

insert into products (name, producer, count, price)
VALUES ('product_5', 'producer_5', 1, 100);

select * from history_of_price;

