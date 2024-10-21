-- alter table exercise

create table artist (
	artist_id int,
	first_name varchar(50),
	last_name varchar(50)
)

-- primary key kısıtlaması konulması
alter table artist
add constraint pk_id primary key(artist_id);

-- sütun isimlerini değiştir
alter table artist rename column first_name to firstname;
alter table artist rename column last_name to lastname;

--sütun eklenmesi
alter table artist
add column dat_of_birth date;

alter table artist
add column address varchar(200);

-- kısıtlamayla sütun eklenmesi
alter table artist
add zip_code int check(zip_code < 9999) -- burada column demesek de oluyor. Diğer yöntemi.

--var olan sütunun tipini değiştirmesi
alter table artist
alter column address type varchar(500);

-- sütuna not null eklenmesi
alter table artist
alter column zip_code set not null;

-- tabloya yeni isim verilmesi
alter table artist
rename to artist_info;