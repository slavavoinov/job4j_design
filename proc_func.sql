
create table products
(
     id       serial primary key,
     name     varchar(50),
     producer varchar(50),
     count    integer default 0,
     price    integer
);
insert into products(name, producer, count, price) values ('product_1', 'producer_1', 88, 100);
insert into products(name, producer, count, price) values ('product_2', 'producer_2', 1, 99);
insert into products(name, producer, count, price) values ('product_3', 'producer_3', 3, 101);
insert into products(name, producer, count, price) values ('product_4', 'producer_4', 67, 102);

create
or replace procedure delete_last_string()
language 'plpgsql'
as $$
    BEGIN
        if  count(*) > 0 THEN
            delete from products
            where id = (select max(id) from products);
        end if;
    END;
$$;

call delete_last_string();

create
or replace function delete_if_not_enough(u_limiter integer)
returns integer
language 'plpgsql'
as
$$
    declare
        start_count integer;
    begin
	select count(*)
	into start_count from products;
        if u_limiter > 0 THEN
        delete from products
        where count <= u_limiter;
        end if;        
        return start_count - count(*);
    end;
$$;

select delete_if_not_enough(20);