use belajar_mysql;

create table products(
id varchar(100) not null,
name varchar(100) not null,
description text,
price int unsigned not null,
quantity int not null default 0,
created_at timestamp not null default current_timestamp
) engine = InnoDB;

show tables;

describe products;
show create table products;

insert into products (id, name, price, quantity) value ('P0001', 'somey', 200000,100);

select * from products;

insert into products (id, name, description, price, quantity) value ('P0002', 'somey','somay ikan sapu-sapu', 200000,100);

insert into products (id, name, description, price, quantity)
value ('P0003', 'Pecel Lele', 'Lele goreng dengan sambal terasi', 18000, 25),
('P0004', 'Siomay Bandung', 'Siomay ikan tenggiri khas Bandung', 22000, 50),
('P0005', 'Batagor', 'Bakso tahu goreng dengan bumbu kacang', 20000, 35),
('P0006', 'Gado-Gado', 'Sayuran rebus dengan bumbu kacang', 17000, 40),
('P0007', 'Rendang Padang', 'Daging sapi rendang khas Minang', 35000, 15),
('P0008', 'Sate Ayam', 'Sate ayam bumbu kacang, 10 tusuk', 25000, 60),
('P0009', 'Nasi Goreng Spesial', 'Nasi goreng dengan telur dan ayam', 20000, 80),
('P0010', 'Tahu Gejrot', 'Tahu goreng dengan kuah pedas manis', 12000, 100);

select * from products;

select id,name,price,quantity from products;
select name,quantity,id from products;


