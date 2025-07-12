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

alter table products
add column category enum ('Makanan', 'Minuman', 'Lain-lain') after name;

alter table products
modify category enum ('Makanan', 'Minuman', 'Lain-lain') after name;


select * from products;
describe products;

Update products
set category = 'Makanan'
where id = 'P0009';

Update products
set category = 'Makanan',
description = 'somey dengan pecel'
where id = 'P0001';


Update products
set price = price - 50000
where id = 'P0001';

Update products
set price = price / 50000
where id = 'P0002';

Update products
set price = price * 10000
where id = 'P0002';

delete from products
where id = 'P0002';



