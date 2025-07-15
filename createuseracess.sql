use belajar_mysql;

# cara membuat user
create user 'anas'@'localhost';
create user 'susanto'@'%';

# cara menghapus user
drop user 'anas'@'localhost';
drop user 'susanto'@'%';

# cara memberikan akses ke user
grant select on belajar_mysql.* to 'anas'@'localhost';
grant select, insert, delete, update on belajar_mysql.* to 'susanto'@'%';

# cara melihat akses yang dimiliki user
show grants for 'anas'@'localhost';
show grants for 'susanto'@'%';

# cara menghapus akses yang dimiliki user
revoke select on belajar_mysql.* from 'anas'@'localhost';
revoke select, insert, delete, update on belajar_mysql.* from 'susanto'@'%';

# cara mensetting password
set password for  'anas'@'localhost' = 'anas';
set password for  'susanto'@'%' = 'susanto';

# cara melakukan backup mysql dengan menggunakan mysqldump
# mysqldump [database_name] --user root --password --result-file=[result file location ]
# mysqldump belajar_mysql --user=root --password --result-file="D:\bagian kuliah\@mulai ngoding\belajar-sql\backup1.sql"

# cara melakukan restore backup data mysql
# cara 1
create database belajar_mysql_import_1;
# di cmd -> mysql --user=root --password [target database name] < [directory file backup database] 
# di cmd -> mysql --user=root --password belajar_mysql_import_1 < "D:\bagian kuliah\@mulai ngoding\belajar-sql\backup1.sql" 

# cara 2 langsung di command script mysql
create database belajar_mysql_import_2_source;
use belajar_mysql_import_2_source;
# source D:/bagian kuliah/@mulai ngoding/belajar-sql/backup1.sql; -> ternyata harus lewat cmd