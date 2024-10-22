-- primary key
-- bir tabloda bir tane olan bir keydir.
-- primary key vasıtası ile arama yaptığımızda sadece o satıra ulaşırız
-- veritabanları otomatik bir index oluşturur primary key vasıtası ile.
-- asla null olamaz
-- primary key = not null + unique gibi düşünebiliriz.
-- foreign key oluşturmak için diğer tabloda primary key e ihtiyaç vardır.
-- Genellikle otomatik artan veriler olur.

create table tablo_adi (
	sutun1 data_type primary key,
	sutun2 data_type,
	... 
)

create table tablo_adi (
	sutun1 data_type,
	sutun2 data_type,
	...
	primary key (sutun1,sutun2) -- iki sütuna göre bir primary key oluşturmuş oluyoruz bu şekilde de. Eğer iki sütuna hitap ediyorsa
	-- bu şekilde en alta yazıyoruz.
)

-- var olan bir tabloda ise
alter table tablo_adi
add primary key(sutun_adi)

-- örnek1
create table authors (
	author_id serial primary key,
	first_name varchar(50),
	last_name varchar(50)
)

--insert into authors values(..) şeklinde yapamazsın çünkü bu şekilde yazınca bütun sütunlara veri atıcam demiş oluyorsun ya
-- serial oldunca da otomatik yapıyor. Böyle yazarsak hata alırız o yüzden postgresql de sütun isimlerini de yazmak lazım
-- insert into authors(first_name,last_name) values(val1,val2) gibi yazarsak doğrusu bu olacaktır.

-- örnek 2
create table products (
	product_no integer,
	description text,
	product_cost numeric
)

alter table products
add primary key(product_no)