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