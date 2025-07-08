use belajar_mysql;

create table barang (
id int not null,
nama varchar(100) not null default '',
harga int not null default 0,
jumlah int not null default 0,
deskripsi text,
waktu_buat timestamp not null default current_timestamp
) engine = innodb;

show tables;

describe barang;

show create table barang;

alter table barang
add column deskripsi text;

alter table barang
add column salah text;

alter table barang
drop column salah;

alter table barang
rename column kode to id; 

alter table barang
modify nama varchar(200)after deskripsi;

alter table barang
modify nama varchar(200) first;

alter table barang
modify nama varchar(200) not null default '',
modify id int not null default 0,
modify harga int not null default 0,
modify jumlah int not null default 0;

alter table barang
add waktu_buat timestamp not null default current_timestamp;

insert into barang(id, nama) values(20,'Jokowi');
insert into barang(id, nama) values(15,'melamun');

select * from barang;

truncate barang;

drop table barang;

show tables;

