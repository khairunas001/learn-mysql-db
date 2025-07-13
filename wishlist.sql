use belajar_mysql;

create table wishlist(
id int not null auto_increment,
id_product varchar(100) not null,
description text,
primary key (id),
constraint fk_wishlist_product foreign key(id_product) references products (id)
)engine = innodb;

show create table products;
show create table wishlist;

-- untuk delete relationship
alter table wishlist
drop  constraint fk_wishlist_product;

-- untuk add relationship
alter table wishlist 
add constraint fk_wishlist_product foreign key(id_product) references products (id);

insert into wishlist(id_product, description) value('P0009', 'nasgor wuenak'),('P0003', 'puecel wuenak');

select * from products;
select * from wishlist;

delete from products where id = 'P0011';

-- Mengubah Behavior Menghapus Relasi
alter table wishlist 
add constraint fk_wishlist_product foreign key(id_product) references products (id)
on delete cascade on update cascade;

-- Join --
select * from wishlist join products on (wishlist.id_product = products.id); 

select products.id, products.name, wishlist.description from wishlist join products on (wishlist.id_product = products.id);

-- membuat relasi ke table customers
alter table wishlist 
add column id_customer int;

alter table wishlist
add constraint fk_wishlist_customers
foreign key (id_customer) references customers(id);

show create table wishlist;

update wishlist
set id_customer = 9
where id =6;

select customers.email, products.id, products.name, wishlist.description from wishlist
join products on (products.id=wishlist.id_product)
join customers on (customers.id=wishlist.id_customer);

select * from products;
select * from wishlist;
select * from customers;

insert into wishlist(id_product, description) value('P0009', 'nasgor wuenak');