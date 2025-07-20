CREATE database studikasus_multi_bahasa;

USE studikasus_multi_bahasa;

create table categories(
id varchar(100) not null,
position int not null,
primary key (id)
)engine = innodb;

desc categories;

insert into categories(id, position)value('FOODS',1),('BAVERAGES',2),('COMPUTERS',3);

select * from categories order by position;

create table categories_translation(
category_id varchar(100) not null,
language varchar(100) not null,
name varchar(100) not null,
description text,
primary key (category_id, language),
constraint fk_categories_translation foreign key (category_id) references categories(id)
)engine = innodb;

desc categories_translation;

INSERT INTO categories_translation(category_id, language, name, description)
VALUES ('FOODS', 'in_ID', 'Makanan', 'Deskripsi Makanan'),
('FOODS', 'en_US', 'Foods', 'Foods description'),
('FOODS', 'jp_JA', 'たべもの', '食品の説明'),
('FOODS', 'jw_JW', 'Daharan', 'Katrangan Panganan');

INSERT INTO categories_translation(category_id, language, name, description)
VALUES ('BAVERAGES', 'in_ID', 'Minuman', 'Deskripsi Minuman'),
('BAVERAGES', 'en_US', 'Baverages', 'Baverages description'),
('BAVERAGES', 'jp_JA', '飲み物', '飲み物の説明'),
('BAVERAGES', 'jw_JW', 'Unjukkan', 'Katrangan Unjukkan');

INSERT INTO categories_translation(category_id, language, name, description)
VALUES ('COMPUTERS', 'in_ID', 'Komputer', 'Deskripsi Komputer'),
('COMPUTERS', 'en_US', 'Computers', 'Computers description'),
('COMPUTERS', 'jp_JA', 'コンピューター', 'コンピューターの説明'),
('COMPUTERS', 'jw_JW', 'Komputer', 'Katrangan Komputer');

select * from categories c
join categories_translation ct on ct.category_id = c.id
where ct.language = 'jp_JA' order by position;

select * from categories c
join categories_translation ct on ct.category_id = c.id
where ct.language = 'en_US' order by position; 

select * from categories c
join categories_translation ct on ct.category_id = c.id
where ct.language = 'jw_JW' order by position; 

select * from categories c
join categories_translation ct on ct.category_id = c.id
where ct.language = 'in_ID' order by position; 

