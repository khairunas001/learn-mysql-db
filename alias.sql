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

select 	id as 'kode produk',
		name as 'nama',
		category as 'kategori',
		price as 'harga',
		quantity as 'kuantitas'
from products;

select 	p.id as 'kode produk',
		p.name as 'nama',
		p.category as 'kategori',
		p.price as 'harga',
		p.quantity as 'kuantitas'
from products as p;