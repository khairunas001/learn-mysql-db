use belajar_mysql;

create table orders (
id int not null auto_increment,
total int not null,
order_date datetime not null default current_timestamp,
primary key (id)
)engine = innodb;

create table order_detail(
id_product varchar(100) not null,
id_order int not null,
price int not null,
quantity int not null,
primary key (id_product, id_order)
)engine = innodb;

desc orders;
desc order_detail;

-- membuat foreign key untuk order detail
alter table  order_detail
add constraint fk_orders_detail_product
foreign key (id_product) references products(id);

alter table order_detail
add constraint fk_orders_detail_order
foreign key (id_order) references orders(id);

show create table order_detail;

select * from orders;
select * from order_detail;
select * from products;

insert into orders (total) value(100000);

insert into order_detail (id_product,id_order, price,quantity) 
value('P0007', 1,50000,1), ('P0008', 1,50000,1),
	 ('P0007', 5,25000,2), ('P0001', 5,50000,1),
     ('P0007', 3,25000,2), ('P0001', 3,25000,2);
     
select * from orders
join order_detail on (order_detail.id_order = orders.id)
join products on (order_detail.id_product = products.id);

select orders.id, products.id, order_detail.quantity, order_detail.price from orders
join order_detail on (order_detail.id_order = orders.id)
join products on (order_detail.id_product = products.id);

insert into products (id,name, price) value('X0001', 'test 1',100000),('X0002', 'test 2',10000);
