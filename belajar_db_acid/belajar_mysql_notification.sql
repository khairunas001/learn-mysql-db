create database belajar_mysql_notification;

use belajar_mysql_notification;

show tables;

# User
create table users (
id varchar(100) not null primary key,
name varchar (100) not null
)engine = innodb;

desc users;

insert users(id, name) 
value ('joko', 'jokondo kondo'),
('budi','budi speed nahan ijazah');

select * from users;

# Notification
create table notification (
id int not null auto_increment primary key,
user_id varchar(100),
category_id varchar (100),
title varchar(100) not null,
detail text not null,
create_at timestamp not null default current_timestamp,
constraint fk_notification_users foreign key (user_id) references users(id),
constraint fk_notification_category foreign key (category_id) references category(id)
)engine = innodb;

desc notification;

INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pesanan', 'Detail Pesanan', CURRENT_TIMESTAMP(), 'joko');
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Promo', 'Detail Promo', CURRENT_TIMESTAMP(), null);
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pembayaran', 'Detail Pembayaran', CURRENT_TIMESTAMP(), 'budi');

select * from notification;

select * from notification where (user_id = 'joko' or user_id is null) order by created_at desc;
select * from notification where (user_id = 'budi' or user_id is null) order by created_at desc;

# Category

create table category(
id varchar(100) not null primary key,
name varchar (100) not null
)engine = innodb;

alter table notification
add column category_id varchar(100);

alter table notification
add constraint fk_notification_category foreign key (category_id) references category(id);

show tables;

select * from category;
insert into category(id, name) value('PROMO','Promo'),('INFO','info');

select * from notification;

update notification
set category_id = 'PROMO'
where user_id is null;

update notification
set category_id = 'INFO'
where user_id is not null;

select * from notification
join category on (category.id = notification.category_id)
where (user_id = 'joko' or user_id is null) order by created_at desc;

select * from notification
join category on (category.id = notification.category_id)
where (user_id = 'budi' or user_id is null) order by created_at desc;

select user_id, title ,detail ,name as 'notification category'  from notification
join category on (category.id = notification.category_id)
where (user_id = 'budi' or user_id is null) order by created_at desc;

-- untuk mengambil promo saja 
select * from notification
join category on (category.id = notification.category_id)
where (user_id = 'budi' or user_id is null) and category.id = 'PROMO' order by created_at desc;

-- untuk mengambil info saja 
select * from notification
join category on (category.id = notification.category_id)
where (user_id = 'joko' or user_id is null) and category.id = 'INFO' order by created_at desc;

alter table notification change create_at created_at timestamp;


# Notification Read
create table notification_read(
id int not null auto_increment primary key,
is_read boolean not null,
notification_id int not null,
user_id varchar(100) not null,
constraint fk_notification_read_notification foreign key (notification_id) references notification(id),
constraint fk_notification_read_user foreign key (user_id) references users(id) 
)engine=innodb;

desc notification_read;

SELECT * FROM notification;

INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES (true, 1, 'joko');
INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES (true, 4, 'budi');

SELECT * FROM notification_read;

select * from notification n
join category c on (c.id = n.category_id)
left join notification_read nr on (nr.notification_id = n.id)
where (n.user_id = 'joko' or n.user_id is null) 
and 
(nr.user_id = 'joko' or nr.user_id is null) order by created_at desc;

INSERT INTO notification(title, detail, category_id, user_id, created_at)
VALUES ('Contoh Pesanan Lagi', 'Detail Pesanan lagi', 'INFO', 'joko', CURRENT_TIMESTAMP());
INSERT INTO notification(title, detail, category_id, user_id, created_at)
VALUES ('Contoh Promo Lagi', 'Detail Promo lagi', 'PROMO', null, CURRENT_TIMESTAMP());


# Counter
select count(*) from notification n
join category c on (c.id = n.category_id)
left join notification_read nr on (nr.notification_id = n.id)
where (n.user_id = 'joko' or n.user_id is null) 
and (nr.user_id is null) order by created_at desc;

select * from notification;

INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES (true, 1, 'joko');
INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES (true, 2, 'joko');
INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES (true, 3, 'joko');
INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES (true, 5, 'joko');



