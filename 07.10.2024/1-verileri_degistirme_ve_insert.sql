-- sql komut tipleri
-- dql(data query language): Sadece select komutu vardır içinde.
-- ddl(data dictionary language): create,alter,drop,truncate,rename vardır.
-- dml(data manupulation language):select,insert,update,delete gibi komutlar vardır. select bazı kaynaklarda burada gösteriyor bazı
-- kaynaklarda da dql de gösteriliyor.
-- dcl(data control language): grant ve revoke gibi yetki alma ve yetki verme komutlarıdır.
-- tcl(transaction control language): commit, rollback ve savepoint gibi komutlar mevcuttur.

-- crud(create,read,update,delete)ile veritabanında değişiklik ve okuma yapabiliriz.

--insert: veri eklemede kullanılır.
insert into tablo_adi(column1,column2..) values(value1,value2) -- sütun isimlerini yazabilirsin de yazmayabilirsin de

--implicit: Sütun isimleri ile ekleme yapılmasına denir. 
insert into departments(department_id,department_name,location_id)
values(13,'Networking',2400); -- eğer identity ise sütun o sütunu yazmamıza gerek yok. Ve zorunlu alanlara veri eklememiz gerekli.

--explicit: Sütun isimleri yazmadan ekleme yapılmasıdır. Sütun isimleri yazmadığımız sürece sütunların tablodaki oluşturulma sırasında
--ekleme yapar.
insert into basket_a values(9,'Watermelon'); -- eğer sütun isimlerini yazmazsak sütun değerlerinin hepsini girmeliyiz. 
--Eğer yoksa öyle bir değer null olarak girebiliriz.

-- insert default value
insert into student(id,name,class,mark,gender,course_name)
values(36,'Adele',default,default,default,'Finance'); -- default yazarak tabloyu oluştururken oluşturduğumuz default değerleri kullanır

insert into student(id,name,mark,course_name) values(28,'Tuncay Şanlı',85,'History')-- normalde girilecek olan sütunları 
--vermediğimizde de defaultunda ne yazıyorsa onu verir. 

--returning: Bizim insert cümlemizden sonraki satır ya da satırları döndürmemizi sağlar.
insert into tablo_adi(col1,col2,col3..)
values(val1,val2,val3..)
returning * -- bu şekilde insert edilen satırların tüm sütunlarını döner.
returning id -- insert edilen satırların sadece belirli bir sütununu döner.
returning output_expression as output_name; -- istediğimiz sütunlara alias vererek de döndürebiliriz bu şekilde.

create table basket_c (
	id_c serial primary key, -- serial demek otomatik artan oluyor.
	fruit_c varchar(50) not null,
	calorie integer default 0
)

insert into basket_c(fruit_c)
values('Orange') 
returning id_c;

insert into basket_c(fruit_c)
values('Watermelon') 
returning id_c as last_id;

insert into basket_c(fruit_c)
values('Apple') 
returning *;

-- çoklu satır insert etme
insert into tablo_adi(col1,col2,col3..)
values(val1,val2,val3...),
(val1,val2,val3...)
...
returning * | output_expression;

insert into departments(department_id,department_name,location_id)
values
	(14,'Acedemy',1700),
	(15,'Security',1400),
	(16,'Logistic',2500),
	(17,'Customer Experience',2400);

insert into basket_c(fruit_c)
values
	('Lime'),
	('Peach')
returning *;

-- insert ederken başka bir tablodan veri kopyalama: alt sorgu kullanılır, values yazılmaz.
-- insertte belirlediğimiz sütunların sayısı ve tipleri ile sorgudan gelecek olan sayı ve tipleri uyumlu olmalıdır.
-- Sorgudan gelen tüm satırlar tek seferde insert edilir.

insert into basket_c(fruit_c)
select fruit_a from basket_a
union
select fruit_b from basket_b

select * from basket_c;

-- başka bir tabloya birebir benzer tablo oluşturmak
create table managers as -- tablonun adı managers
select * from employees -- employees tablosunun kopyasını oluşturmak istiyorum
where 1=0 -- datanın gelmesini istemiyorsak 1=0 yazarız. veya geçersiz herhangi bir şart a=b de yazabiliriz. data da gelsin dersek
-- where şartını kaldırmamız gerekli. Kısıtlamaları vs almaz sadece sütun adları ve tiplerini alır.

insert into managers
select * from employees 
where job_id in (
	select job_id from jobs
	where lower(job_title) like '%manager%'
)
	


