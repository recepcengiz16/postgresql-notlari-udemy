-- serial veri tipleri
create table tablo_adi (
	id serial --
)

create table colors2 (
	colors_id smallserial,
	color varchar(30)
)

insert into colors2(colors_id,color) values(DEFAULT,'Red') -- Normalde otomatik artan id. İlla ki tablonun yanında ismini yazıcam 
-- diyorsan value olarak default yazmak lazım

-- seriallarla ilgili en son nerede kaldı öğrenebiliriz.
pg_get_serial_sequence('table_name','column_name')
select currval(pg_get_serial_sequence('colors','colors_id')) -- colors tablomdaki son değer.
select nextval(pg_get_serial_sequence('colors','colors_id')) -- colors tablomdaki son değeri bir artırmak için.