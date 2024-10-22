-- not null constraint: Bir sütunun değerinin null olmasını engeller. Eğer null value girilirse hata verir.

--tablo oluşturulurken
create table person (
	id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(50) unique -- null değerler unique kısıtlamasına girmiyor.
)

--var olan tablodan not null eklenmesi ya da çıkarılması
alter table customer
alter column first_name set not null,
alter column last_name drop not null;
