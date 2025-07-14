use belajar_mysql;

create table categories(
id  varchar(100) not null,
name varchar(100) not null,
primary key (id)
) engine = innodb;

desc categories;

alter table products
drop column category;

desc products;

alter table products
add column id_category varchar (100);

alter table products
add constraint fk_products_category
foreign key (id_category) references categories(id);

select * from products;

insert into categories (id, name)value('C0001', 'Makanan'), ('C0002', 'Minuman'), ('C0003', 'Lainnya');
insert into categories (id, name)value('C0004', 'Oleh-oleh'), ('C0005', 'Banyu surga');

select * from categories;

update products
set id_category = 'C0001'
where id in ('P0001','P0002','P0003', 'P0004');

update products
set id_category = 'C0002'
where id in ('P0005','P0006','P0007', 'P0008');

update products
set id_category = 'C0003'
where id in ('P0010','P0009');

select products.id, products.name, categories.name
from products
join categories on (categories.id = products.id_category);

-- inner join sama dengan join biasa
select * from categories
inner join products on (categories.id = products.id_category);

-- left join, dimana akan menampilkan semua data di table 1 (categorires) dan jika tidak ada nilai di table2 (products) akan bernilai null
select * from categories
left join products on (categories.id = products.id_category);

-- right join, sama dengan left join tapi kebalikannya. semua data di table kedua akan 
-- diambil juga Jika ada yang tidak memiliki relasi di table pertama, maka hasilnya akan NULL
select * from categories
right join products on (categories.id = products.id_category);

-- CROSS JOIN adalah melakukan join dengan cara mengkalikan data di tabel pertama dengan dada di table 
-- kedua Artinya jika ada 5 data di tabel pertama, dan 5 data di tabel kedua, akan menghasilkan 25 kombinasi data (5 x 5)
select * from categories
cross join products;

-- iseng
create table numbers(
id int not null,
primary key (id)
)engine = innodb; 

insert into numbers(id) value (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

select numbers1.id, numbers2.id, (numbers1.id*numbers2.id) as 'result' from numbers as numbers1
cross join numbers as numbers2 order by numbers1.id, numbers2.id;

 

 