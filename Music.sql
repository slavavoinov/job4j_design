create table author (
    id serial primary key,
    name text,
    year int		
);

create table compose (
    id serial primary key,
    name text,
    author_id int references author(id)
);

insert into author(name, year) values ('Metallica', 1981);
insert into author(name, year) values ('Nirvana', 1987);
insert into author(name, year) values ('ACDC', 1973);

insert into compose(name, author_id) values ('Unforgiven', 1);
insert into compose(name, author_id) values ('Smells like teen spirit', 2);
insert into compose(name, author_id) values ('Higway to hell', 3);

select pp.name, p.name, p.year 
from compose as pp join author as p on pp.author_id = p.id;

select pp.name as Имя, p.name as Имя, p.year as Год 
from compose as pp join author as p on pp.author_id = p.id;

select pp.name as "Название группы", p.name as "Название композиции", p.year as "Год основания" 
from compose as pp join author as p on pp.author_id = p.id;