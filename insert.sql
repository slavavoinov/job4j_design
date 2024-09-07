
insert into users(name) values ('Вячеслав');
insert into users(name) values ('Петр');

insert into item(item_name) values ('bug1');
insert into item(item_name) values ('bug2');
insert into item(item_name) values ('bug3');

insert into comment(item_id, comment_text) values ('1', 'comment1');

insert into role(role_type, user_id) values ('user', '1');
insert into role(role_type, user_id) values ('admin', '2');

insert into rule(rule_type) values ('user_rules');
insert into rule(rule_type) values ('admin_rules');

insert into role_rule(role_type, rule_type) values ('user', 'user_rules');
insert into role_rule(role_type, rule_type) values ('admin', 'admin_rules');

insert into category(category_name, item_id) values ('bugs', '1');
insert into category(category_name, item_id) values ('bugs', '2');

insert into state(state_name, item_id) values ('accepted', '1');
insert into state(state_name, item_id) values ('wait', '2');