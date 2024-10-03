
select * from products;
begin;
declare cursor_products scroll cursor for select * from products;
move last from cursor_products;

move backward 4 from cursor_products;

fetch prior from cursor_products;

move backward 7 from cursor_products;

fetch prior from cursor_products;

move backward 4 from cursor_products;
fetch prior from cursor_products;

fetch prior from cursor_products;

close cursor_products;

commit;