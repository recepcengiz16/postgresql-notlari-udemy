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
where id= 5; -- explain ile bu sorgunun veritabanına ne kadar maliyeti olduğunu detaylarını gösteriyor.