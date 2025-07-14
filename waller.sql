use belajar_mysql;

create table wallet(
id int not null auto_increment,
id_customer int not null,
balance int not null default 0,
primary key (id),
unique key fk_id_customer_unique (id_customer),
constraint fk_wallet_customer
foreign key (id_customer) references customers(id)
)engine = innodb;

desc wallet;
desc customers;

select * from customers;

select * from wallet;

insert into wallet (id_customer) value(1), (9);

update wallet
set balance = 2000000
where id = 1 ;

update wallet
set balance = 90000000 / 100
where id = 2 ;

select customers.email, wallet.balance, customers.id from wallet
join customers on (customers.id=wallet.id_customer);
