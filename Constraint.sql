use belajar_mysql;

create table customers(
id int not null auto_increment,
email varchar(100) not null,
first_name varchar(100) not null,
last_name varchar(100),
primary key (id),
unique key email_unique (email)
)engine = innodb;

desc customers;
show create table customers;

alter table customers
drop constraint email_unique;

alter table customers
add constraint email_unique unique(email);

insert into customers (email,first_name, last_name) value('jokognd@gmail.com','joko','mulyadi');

select * from customers;
insert into customers (email,first_name, last_name) value('jnd@gmail.com','Moko','Mekie');


create table products(
id varchar(100) not null,
name varchar(100) not null,
category enum ('Makanan', 'Minuman', 'Lain-lain'),
description text,
price int unsigned not null,
quantity int not null default 0,
created_at timestamp not null default current_timestamp,
primary key(id),
constraint price_check check(price > 1000)
) engine = InnoDB;

alter table products
drop constraint price_check;

alter table products
add constraint price_check check(price > 1000);

desc products;

insert into products(id,name,category,price,quantity) value('P00012','minuman',500,1000);

select * from products;
