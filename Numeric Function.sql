use belajar_mysql;

select 10 + 10 as hasil;

select id, name, price, price div 1000 as 'price in k' from products; 

select id, sin(price),cos(price),tan(price), power(price,2) from products; 

select id, name, price from products where price div 1000 > 20;