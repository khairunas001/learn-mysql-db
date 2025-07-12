use belajar_mysql;

create table sellers(
id int not null auto_increment,
name varchar(100),
name2 varchar(100),
name3 varchar(100),
email varchar(100),
primary key (id), -- tidak perlu menambahkan index karena sudah default dari primary key
unique key email_unique(email), -- tidak perlu menambahkan index karena sudah default dari unique key 
index name_index(name),
index name2_index(name2),
index name3_index(name3),
index name_name2_name3_index(name, name2,name3)
)engine = innodb;

desc sellers;
show create table sellers;

-- cara menghapus index
alter table sellers
drop index name2_index;

-- cara mmenambah index
alter table sellers
add index name2_index (name2);

-- cara penggunaan index dalam melakukan querry
select * from sellers where name = 'Joko'; 

select * from sellers where name = 'Joko' and name2 = 'mulyadi'; 

select * from sellers where name = 'Joko'and name2 = 'mulyadi' and name3 = 'mulyanto'; 

INSERT INTO sellers (name, name2, name3, email)
VALUES ('Joko', 'mulyadi', 'rahman', 'joko.mulyadi@example.com');