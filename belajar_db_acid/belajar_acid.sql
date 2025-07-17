create database belajar_acid;

use belajar_acid;

create table accounts(
id varchar(100) not null primary key,
name varchar(100) not null,
balance bigint not null
) engine = innodb;

select * from accounts;
desc accounts;

# Atomicity: Setiap transaksi dijalankan sepenuhnya atau tidak sama sekali.
# Atomicity transaksi commit/berhasil
start transaction;

insert into accounts(id, name,balance) 
value('bagus', 'bagus sekali', 20000000);

insert into accounts(id, name,balance) 
value('joko', 'dada', 60000000);

select * from accounts;

commit;

# Atomicity transaksi rollback/gagal
start transaction;

delete from accounts where id = 'joko';

delete from accounts where id = 'bagus';

select * from accounts;

rollback;

# Consistency: Transaksi harus menjaga konsistensi data sebelum dan sesudah dilakukan.
start transaction;

-- tidak berhasil karena ini berlawanan dengan yang sudah ditentukan dimana name adalah not null
update accounts
set name = null
where id = 'joko'; 

commit;

# Isolation: Transaksi yang berjalan bersamaan tidak saling mengganggu.
start transaction;

select * from accounts where id in ('joko', 'bagus') for update;

update accounts set balance = balance - 5000000
where id = 'joko';

update accounts set balance = balance + 5000000
where id = 'bagus';

commit;

# Durability: Setelah transaksi selesai, datanya tetap tersimpan walau sistem mati.
# 1 transaksi gagal
start transaction;

select * from accounts where id in ('joko', 'bagus') for update;

update accounts set balance = balance - 5000000
where id = 'joko';
select * from accounts;

# mysql di shutdown -> data akan kembali seperti sebelum start transaction; dieksekusi
update accounts set balance = balance + 5000000
where id = 'bagus';

commit;

# 2 transaksi berhasil
start transaction;

select * from accounts where id in ('joko', 'bagus') for update;

update accounts set balance = balance - 5000000
where id = 'joko';
select * from accounts;

update accounts set balance = balance + 5000000
where id = 'bagus';

commit;
# data akan tetap sesuai dengan yang paling akhir, karena commit sudah dieksekusi