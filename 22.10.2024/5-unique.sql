-- unique constraint: Kolon ya da kolnların içerisindeki değerlerin benzersiz olmasını sağlar.
-- bir veya daha fazla kolonu unique yapabiliriz ve unique kısıtlaması eklediğimizde postgresql arkada otomatik unique index 
-- oluşturur.

-- 
create table person (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50) unique
)

create table person (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50), 
	unique(email)
)

--sonradan tabloya unique kısıtlamasının eklenmesi
alter table person
add constraint uq_email unique(email)

--örnek
create table customer_new (
	customer_id serial not null,
	first_name character varying(45),
	last_name character varying(45),
	email character varying(45),
	address_id smallint not null,
	unique(first_name,last_name,address_id) -- adı soyadı ve adresi aynı olan veri olmamalı. Birden fazla tek tek yazarsak tek
	-- tek ayrı ayrı unique olmuş olur. Diğer kısıtlamaları yazarken de böyle.
)