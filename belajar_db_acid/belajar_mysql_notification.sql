create database belajar_mysql_notification;

use belajar_mysql_notification;

show tables;

create table users (
id varchar(100) not null primary key,
name varchar (100) not null
)engine = innodb;

desc users;

insert users(id, name) 
value ('joko', 'jokondo kondo'),
('budi','budi speed nahan ijazah');

select * from users;

create table notification (
id int not null auto_increment primary key,
user_id varchar(100),
title varchar(100) not null,
detail text not null,
create_at timestamp not null default current_timestamp,
constraint fk_notification_users foreign key (user_id) references users(id)
)engine = innodb;

desc notification;

INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pesanan', 'Detail Pesanan', CURRENT_TIMESTAMP(), 'joko');
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Promo', 'Detail Promo', CURRENT_TIMESTAMP(), null);
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pembayaran', 'Detail Pembayaran', CURRENT_TIMESTAMP(), 'budi');

select * from notification;

select * from notification where (user_id = 'joko' or user_id is null);
select * from notification where (user_id = 'budi' or user_id is null);

