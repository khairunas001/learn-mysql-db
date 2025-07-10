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

-- operator perbandingan
select id, name, price, quantity from products where quantity > 10;

select id, name, price, quantity from products where quantity <= 40;

select id, name, price, quantity from products where quantity >= 40;

select id, name, price, quantity from products where quantity != 40;

-- operator logika AND
select id, name, price, quantity from products where quantity <40 and price <=40000;

-- operator logika OR
select id, name, price, quantity from products where quantity <40 or price <=40000;

-- operator logika dengan prioritas, jika default akan diutamakan AND daripada OR
select * from products where ( category =  'Makanan' or price <=40000) and quantity <40 ;

select * from products where category =  'Makanan' or price <=40000 and quantity <40 ;


-- LIKE OPERATOR tapi lambat jika datanya sudah banyak
select * from products where name like '%lele%'; -- yang ada karakter lele

select * from products where name like '%ado%'; -- yang ada karakter ado

select * from products where name like '%t'; -- untuk akhiran dengan huruf t

select * from products where name like 'b%'; -- untuk awalan dengan huruf b

select * from products;

 -- BETWEEN OPERATOR SAMA DENGAN WHERE price >= 10000 AND price <= 20000
select * from products where price between 10000 and 20000;  

select * from products where price not between 10000 and 20000;  -- jika ini nilai diluar antara 10000 dan 20000

-- Operator IN adalah operator untuk melakukan pencarian sebuah kolom dengan beberapa nilai.
select * from products where category in ('makanan', 'minuman'); 

select * from products where category not in ('makanan', 'minuman'); -- jika ini nilai diluar category

update products set category = 'makanan' where id in ('P0005','P0006');


 