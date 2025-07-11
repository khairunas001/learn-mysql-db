use belajar_mysql;

create table admin (
id int not null auto_increment,
first_name varchar (100),
last_name varchar(100),
primary key (id)
)engine = innodb;

desc admin;

insert into admin(first_name, last_name)
value ('Alamak','Mengakal'),('Ruri','Sinaga'), ('Manuk','Paijo');

select * from admin;

delete from admin where id = 2;

insert into admin(first_name, last_name)
value ('Ruri','Sinaga'), ('Malang','Kental');

select last_insert_id();
