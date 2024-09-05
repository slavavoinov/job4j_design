create table fauna
(
    id             serial primary key,
    name           text,
    avg_age        int,
    discovery_date date
);

insert into fauna(name, avg_age, discovery_date) values ('goldfish', 9125, '265-01-01');
insert into fauna(name, avg_age, discovery_date) values ('salmon', 540, null);
insert into fauna(name, avg_age, discovery_date) values ('whale_shark', 20000, '1828-01-01');

select * from fauna where name like '%fish%';
select * from fauna where avg_age > 10000 and avg_age < 21000;
select * from fauna where discovery_date is null;
select * from fauna where discovery_date > '01.01.1950';