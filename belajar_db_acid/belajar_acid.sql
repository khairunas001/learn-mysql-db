create database belajar_acid;

use belajar_acid;

create table accounts(
id varchar(100) not null primary key,
name varchar(100) not null,
balance bigint not null
) engine = innodb;

select * from accounts;
desc accounts;