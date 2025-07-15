start transaction;

select * from guestbooks;

update guestbooks
set title = "Alamak judul dari user2"
where id = 2;

commit;

# FOR UPDATE digunakan diakhir query select agar tidak ada user lain yang melakukan select sebelum 
# proses sebelumnya selesai atau dilakukan commit atau rollback
START TRANSACTION ;

SELECT * FROm products;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE ;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT ;

#  DEADLOCK kondisi dimana semua user saling 
# menunggu karena user saling melakukan locking
START TRANSACTION ;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE ;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE ;

# LOCK TABLE READ
# yang Melakukan Lock -> Hanya bisa melakukan read terhadap tabel tersebut
# Proses lain -> Hanya bisa melakukan read terhadap tabel tersebut, tidak bisa melakukan write
SELECT * FROM products;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

# LOCK TABLE WRITE
# yang Melakukan Lock -> Bisa melakukan read dan write terhadap tabel tersebut
# Proses lain -> Tidak bisa melakukan read dan write
SELECT * FROM products;

# LOCK INSTANCE
# Lock instance adalah perintah locking yang akan membuat 
# perintah DDL (data definition language) akan diminta menunggu sampai proses unlock instance
ALTER TABLE products
ADD column sample VARCHAR(100);