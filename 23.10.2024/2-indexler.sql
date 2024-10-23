-- indexler
-- veriye en hızlı ulaşmamızı sağlayan nesnelerdir.
-- index bize verinin tablonun hangi satırında yer aldığını ve diskin hangi bölümüne konulduğunu gösterir.
-- verilerin önceden sıralanmasını sağlarlar.

-- syntax
create index index_name on tablo_adi
(
	sutun_adi [asc | desc] [ nulls {first|last}], -- biz asc veya desc diye belirtmezsek asc diye veritabanında örneğin
	-- string verileri a'dan z'ye olarak sıralayarak saklar. null lar önce olsun veya sonra olsun ayarı da yapabiliriz.
	... -- burada yazdığımız sütun sırasına göre oluşturulma ve sıralama farkı vardır. Aynı zamanda erişim farkı da vardır.
)

--örnek
explain
select * from tablo_adi
where id= 5; -- explain ile bu sorgunun veritabanına ne kadar maliyeti olduğunu detaylarını gösteriyor. MsSql de de var bu maliyeti
-- öğrenme ama biraz farklı onda da. 

-- index işleminde de bir maliyet oluyor. O index ile ilgili veriler her update insert ve delete işleminde ona göre 
-- yeniden düzenleniyor.

-- örnek
create index idx_phone
on address(phone); -- like, ilike, in ve between gibi operatörlerde sorguyu ararken index özelliğinden yararlanmayabilir.

-- birden fazla sütunda index kullanma
create index index_name
on tablo_adi(a,b,c,d..) -- gibi. Neden birden fazla sütuna index verilir. Şartlarda genelde hep aynı sütunlarda arama yapıyorsak
-- mesela

/*
CREATE INDEX index_name
ON tablo_adi(a, b);

Bu ifade, "a" ve "b" sütunlarını birlikte indeksleyen tek bir indeks oluşturur. Yani burada a ve b sütunları ayrı ayrı indekslenmez 
bu indeks, önce "a" sütununa göre, sonra da "b" sütununa göre sıralama yapar.
*/


