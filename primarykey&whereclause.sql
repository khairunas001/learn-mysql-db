use belajar_mysql;

create table products(
id varchar(100) not null,
name varchar(100) not null,
description text,
price int unsigned not null,
quantity int not null default 0,
created_at timestamp not null default current_timestamp,
primary key(id)
) engine = InnoDB;

alter table products
add primary key (id);

select * from products;

describe products;

select * from products where quantity = 50;
select * from products where quantity <= 50;

select * from products where quantity = 50;

select * from products where price = 22000;
select * from products where price >= 22000;