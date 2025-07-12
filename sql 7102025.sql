use belajar_mysql;

select * from products;

-- String Function 
select 	id,
		 lower(name) as 'name lower',
		 upper(name) as 'name upper',
		 length(name) as 'name length' 
 from products;
 
select * from products;

-- Date dan Time Function
select id, created_at,
		extract(year from created_at) as 'year',
        extract(month from created_at) as 'month',
        extract(hour from created_at) as 'month'
from products;

select id, created_at,
		year(created_at),
        month(created_at),
        hour(created_at)
from products;

-- Flow Control Function 
select id,
	category,
	case category
    when 'makanan' then 'wuenakk'
    when 'minuman' then 'sueger'
    else 'opo iki rek'
    end as category
from products;

select id,
	price,
    if (price <= 20000, 'murah',
    if ( price <= 40000, 'muahal','luarang')) as 'luarang kah cik?'
from products;

insert into products (id,name, price, quantity) value ('P0011','es dawet', 20000,1000);

select id, name, ifnull(description, 'sungguh kosong') from products;

-- Aggregate Function
select count(id) from products; 

select max(price) from products;

select min(price) from products;

select avg(price) from products;

select sum(price) from products;

select sum(quantity) from products;

select avg(quantity) from products;


-- Aggregate Function Grouping by
select count(id) as 'total', category from products group by category; 

select max(price) as 'max price', category from products group by category;

select min(price) as 'min price', category from products group by category;

select avg(price) as 'avg price', category from products group by category;

select sum(price) as 'sum price', category from products group by category;

select sum(quantity) as 'sum quantity', category from products group by category;

select avg(quantity) as 'avg quantity', category from products group by category;

select count(id) as 'total' , category from products group by category having total > 2; 