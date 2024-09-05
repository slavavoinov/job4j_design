create table users(
	user_id serial primary key,
	name varchar(255)
);

create table item(
	item_id serial primary key,
	item_name varchar(255)	
);

create table user_item(
	item_id int references item(item_id),
	user_id int references users(user_id)
);

create table role(
	role_type varchar(255) primary key,
	user_id int references users(user_id), 
	role_dercription varchar(255)	
);

create table rule(
	rule_type varchar(255) primary key,
	rule_dercription varchar(255)
);

create table role_rule(
	role_type varchar(255) references role(role_type),
	rule_type varchar(255) references rule(rule_type)
);

create table category(
	category_name varchar(255),
	item_id int references item(item_id)
);

create table state(
	state_name varchar(255),
	item_id int references item(item_id)
);

create table comment(
	comment_id serial primary key,
	item_id int references item(item_id),
	comment_text varchar(255)
);

create table attach(
	attach_id serial primary key,
	item_id int references item(item_id),
	attach_text varchar(255)
);

