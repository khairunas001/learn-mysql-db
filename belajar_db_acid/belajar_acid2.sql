use belajar_acid;

select * from accounts;

start transaction;

select * from accounts where id in (joko, bagus) for update;

update accounts set balance = balance - 5000000
where id = joko;

update accounts set balance = balance + 5000000
where id = bagus;

commit;