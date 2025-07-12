use belajar_mysql;


create table products(
id varchar(100) not null,
name varchar(100) not null,
category enum ('Makanan', 'Minuman', 'Lain-lain'),
description text,
price int unsigned not null,
quantity int not null default 0,
created_at timestamp not null default current_timestamp,
primary key(id),
fulltext product_search(name,description),
constraint price_check check(price > 1000)
) engine = InnoDB;

-- cara menambahkan fulltext search 
alter table products
add fulltext product_search (name,description);

-- cara menghapusnya sama seperti index karena fulltext merupakan index
alter table products
drop index product_search;

show create table  products;

-- cara query dengan natural language mode 
select * from products;
select * from products where match (name, description) against ('goreng' in natural language mode);

-- cara query dengan boolean mode
select * from products where match (name, description) against ('+goreng -nasi' in boolean mode);

-- cara query dengan query expansion (konsepnya akan melakukan query dengan natural language mode, tetapi juga akan melakukan queryy lagi dari data yang sebelumnya)
select * from products where match (name, description) against ('goreng' with query expansion);
