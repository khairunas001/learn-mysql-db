use belajar_mysql;

create table guestbooks(
id int not null auto_increment,
email varchar(100) not null,
title varchar(100) not null,
content text,
primary key (id)
)engine = innodb;

ALTER TABLE guestbooks CHANGE contet content TEXT;

select * from customers;
select * from guestbooks;

INSERT INTO guestbooks (email, title, content) VALUES
('john.doe@example.com', 'Hello World', 'This is my first entry in the guestbook.'),
('jane.smith@example.com', 'Greetings', 'Nice website! I really like the design.'),
('budi.rahmat@example.com', 'Salam Kenal', 'Senang bisa mampir di sini, sukses terus!'),
('jnd@gmail.com', 'Pertanyaan', 'Bagaimana cara berkontribusi di website ini?'),
('jnd@gmail.com', 'Terima Kasih', 'Terima kasih atas informasinya, sangat membantu!');

-- querry union (UNION adalah operasi menggabungkan dua buah SELECT query,
-- dimana jika terdapat data yang duplikat, data duplikatnya akan dihapus dari hasil query)
select distinct email from customers
union
select distinct email from guestbooks;

-- query union all dalah operasi yang sama dengan UNION, namun data duplikat tetap akan ditampilkan di hasil query nya 
select distinct email from customers
union all
select distinct email from guestbooks;
-- Tanpa distinct
select email from customers
union all
select email from guestbooks;

select emails.email, count(emails.email) 
from	(select distinct email from customers
		union all
		select distinct email from guestbooks) as emails 
group by email;

-- INTERSECT adalah operasi menggabungkan dua query sama seperti inner join,
-- karena tidak ada   INTERSECT di mysql maka digunakan inner join saja

select distinct email from customers where email in (select distinct email from guestbooks);

select distinct customers.email from customers
inner join guestbooks on (guestbooks.email = customers.email);

-- query minus adalah operasi dimana query pertama akan dihilangkan oleh query kedua
-- karena tidak ada Minus di mysql maka kita menggunakan left join dan menggunakan kondisi where untuk menghapus data querry ke 2 yang sama dengan querry 1

select distinct customers.email, guestbooks.email from customers
left join guestbooks on (guestbooks.email = customers.email)
where guestbooks.email is null; 

-- START TRANSACTION 
-- Memulai proses transaksi, proses selanjutnya akan dianggap transaksi sampai perintah COMMIT atau ROLLBACK
-- COMMIT
-- Menyimpan secara permanen seluruh proses transaksi
-- ROLLBACK
-- Membatalkan secara permanen seluruh proses transaksi

-- jika proses disimpan ke database secara permanen dengan commit 
start transaction;

INSERT INTO guestbooks (email, title, content) VALUES
('Ale ale@example.com', 'Hello World', 'This is my first entry in the guestbook.'),
('sumardhji@example.com', 'Greetings', 'Nice website! I really like the design.'),
('besmambu@example.com', 'Salam Kenal', 'Senang bisa mampir di sini, sukses terus!');

select * from guestbooks;

commit;

-- jika proses ada yang gagal dan ingin di rollback
start transaction;

delete from guestbooks;

select * from guestbooks;

rollback;
      


