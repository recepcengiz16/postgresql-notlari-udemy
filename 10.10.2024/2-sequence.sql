--sequence: Tablo ile ilgili bir nesnedir. Otomatik olarak bir uniqe number üretir. 
-- integer veri tipleridir. primary key olarak da kullanılabilirler. Cache mekanizması kullanıyorsak bunların değerlerine çok hızlı 
-- ulaşabiliriz.

create SEQUENCE if not exists sequence_name
[ as {smallint | integer | bigint}] -- gerekirse tipini verebiliriz.
[ increment by increment_ ] -- bu özellikle istediğimiz gibi artırırız mesela 10'ar 10'ar. Hiç vermezsek 1'er 1'er arttırır. 
[ minvalue minvalue_ | no minvalue ] -- min value da verebiliriz bu sayıdan başla gibi
[ maxvalue minvalue_ | no maxvalue ] -- max value da verebiliriz bu sayı max olsun gibi
[ start [with] start_] -- şu sayıdan başla. Mesela 500 gibi
[cache 20] -- sequence değerlerini cache e almamızı sağlar. Son 20 değeri cache alır ve oradan devam eder.
[[no] cycle] -- 1 den 100 e kadar devam edip tekrar başa dönmemizi sağlar cycle ile
[ owned by {tablo_adi.sutun_adi | none} ] -- bu sequence i bir tabloya bağlayabiliriz. Bu tablodaki bu sütun değeri

--örnek
create sequence sequence_temp
increment 10
start 100; -- asc endingdir. Azdan çoğa gider.

select nextval('sequence_temp') -- o sequence in bir sonraki numarasını getirir. Ama nextval dediğimizde numarayı artırır ve hafızaya
-- öyle kaydeder.

create sequence sequence_descending
increment -1 
minvalue 1
maxvalue 100
start 10 -- 10 dan balatıp geri sayar ve cycle dan dolayı max değere geçip oradan geri saymaya devam eder.
cycle;

-- sequence i bir tabloya bağlı oluşturmak
create table paymnet_details (
	payment_id serial,
	item_id int not null,
	item_text varchar(50) not null,
	price dec(10,2) not null, -- dec decimal demek ve Toplamda 10 basamak olabilir. Bunun 2 basamağı virgülden sonra olacaktır. 
	-- Virgülden önce ise en fazla 8 basamak yer alabilir.
	primary key(payment_id,item_id) -- ikisi birlikte primary key oluyor.
)

create sequence sq_payment_item_id
start 10
increment 10
minvalue 10
owned by payment_details.item_id -- bu şekilde item_id sütunu bir sequence tarafından oluşturuluyor. Eğer owned by olmazsa 
-- bu sequence i başka yerlerde de kullanabiliriz.

insert into paymnet_details(payment_id,item_id,item_text,price)
values
	(100, nextval('sq_payment_item_id'),'Sofa',123),
	(100, nextval('sq_payment_item_id'),'Deneme2',123),
	(100, nextval('sq_payment_item_id'),'Hayati',123),
	(101, nextval('sq_payment_item_id'),'Destere',123),
	(101, nextval('sq_payment_item_id'),'Pati',123)

-- örnek 2: önce sequence i oluşturduk
create sequence sq_payment_id
start 10
increment 10
minvalue 10

create table payment_id (
	payment_id serial,
	item_id int not null default nextval('sq_payment_id'), -- default değeri bu sequence den gelen değer olsun diyoruz.
	item_text varchar(50) not null,
	price dec(10,2) not null,
	primary key(payment_id,item_id)
)

alter sequence sq_payment_id
owned by payment_id.item_id -- burada da daha sonra sütuna bağlamış olduk. İlk başta bağlı değildi.