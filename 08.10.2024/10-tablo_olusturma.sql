-- tablo oluşturma
-- script ile
create table if not exists tablo_adi ( -- if not exists opsiyonel
	col_name_1 datatype_ constraint_,
	col_name_2 datatype_ constraint_,
	col_name_3 datatype_ constraint_,
	table_constraints -- tabloların kısıtlamaları
)

create table educations (
	education_id serial primary key, -- serial autoincrement olarak 4 bytelık 1'den başlayarak auto artıyor.
	education_name varchar(100) not null unique, -- 2. bir eğitim ismi aynı olamaz unique ile.
	description varchar(500),
	start_date date,
	end_date date
)

select * from educations;

create table accounts (
	user_id serial primary key,
	user_name varchar(70) unique not null,
	user_password varchar(70) not null,
	email varchar(200) unique not null,
	created_on timestamp not null default current_date,
	last_login timestamp
)

-- select into: select sorgusundan gelen veriler ve seçilen sütun tipleri ile oluşturulur. Bu komut, 
-- mevcut bir tablodaki belirli verileri yeni bir tabloya kopyalar ve aynı anda bu yeni tabloyu oluşturur.
select select_list -- select_list ten kasıt gelecek sütunlar belki birkaç tablodan joinle gelmiştir belki de sadece bir tablodan 
into new_table_name
from tablo_adi
where sart; -- Yeni eklediğimiz bir sütun olursa onu da postgresql otomatik olarak verecektir.

-- örnek
select f.film_id,f.title,c."name"
	into table film_with_category -- table yazabiliriz de yazmayabiliriz de istersek
from film f,film_category fc,category c
where 
	1=1
	and f.rating = 'R'
	and fc.film_id = f.film_id
	and fc.category_id = c.category_id
order by title;

-- geçici bir tablo oluşturmak yani sadece belirli bir süre ihtiyacım olacak bu tabloya
select film_id,title,length
	into temp table long_film -- temp ifadesi ile geçiciliği sağlamış oluyoruz. Bu şekilde bu tablo sadece kendi sessionımızda oluşur
	-- ve bu tabloyu sadece biz görürürüz başka kullanıcılar göremez. Başka bir sessionda aynı isimle oluşturabiliriz çünkü birbirini
	-- görmüyor. Bu tablo bu sessionu kapattığımızda silinir.
from film 
where length > 150
order by title

-- create table as: Bunun da iki yöntemi var. query ve table
--1) query: Bu tarz sorgularda da verileri ile beraber oluşturur tabloyu.
create table new_table_name (column_name_list)
as query_; -- burada column_name_list query den gelen isimler değil de benim verdiğim isimler olsun diyebiliyoruz. Sorgudan kaç tane
-- sütun geliyorsa o kadar sütun ismi olmalı

create table if not exists new_table_name
as query_;-- böyle bir tablo yoksa create et varsa da hata verme

create [temporary | temp | unlogged] table  new_table_name as query_; -- temporary ya da temp(geçici de oluşturabiliyoruz). Ya da
-- unlogged derken tüm veritabanları oluşturlan table ların verilerini sürekli loglar. Biz de unlogged derken loglamasın manasında.

-- örnek
-- geçici tablo
create temp table horror_film as
select f.film_id,f.title,f.release_year,f.length,f.rating
from film f 
inner join film_category using(film_id)
where category_id = 11;

-- kalıcı tablo
create table horror_film as
select f.film_id,f.title,f.release_year,f.length,f.rating
from film f 
inner join film_category using(film_id)
where category_id = 11;

create table if not exists film_ratings (rating, film_count) as -- seçtiğimiz sütunlara yeniden isim verdik
select rating, count(film_id)
from film
group by rating;

--2) table
create table new_rable as
table var_olan_tablo
[with no data] -- istersek datasını da almayabiliriz istersek de alabiliriz. bu da opsiyonel


create table movies_copy as table movies;

create table movies_copy as table movies with no data;

-- bu yöntem de dokümanlarda geçmez
create table film_with_category_new as
select *
from film f,film_category fc,category c
where 
	1=0 -- bu şekilde olunca yeni tablo oluşturuyor veriler olamdan
	and f.rating = 'R'
	and fc.film_id = f.film_id
	and fc.category_id = c.category_id
order by title;


