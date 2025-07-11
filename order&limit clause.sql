use belajar_mysql;

create table products(
id varchar(100) not null,
name varchar(100) not null,
category enum ('Makanan', 'Minuman', 'Lain-lain'),
description text,
price int unsigned not null,
quantity int not null default 0,
created_at timestamp not null default current_timestamp,
primary key(id)
) engine = InnoDB;

-- order by clause 
select id, category, name from products order by category;

select id, category, price, name from products order by category asc, price desc;

select id, category, price, name from products where price >= 20000 order by category asc, price desc;

-- limit clause
select * from products order by price limit 3; 

select * from products where quantity order by price limit 3; 

select * from products order by price limit 3,3; 

select * from products order by price limit 6,3; 

-- select Distinct Data
select category from products order by category; -- akan menampilkan semua data kategory 

select distinct category from products order by category; -- akan menghapus kategori yang duplikat 