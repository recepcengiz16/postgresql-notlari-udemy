-- like operatörü: bunun gibileri getir demek oluyor. Belirli bir isteğe göre belirlenmiş stringleri bulmamıza olanak sağlar.

-- % ve _ karakterleri ile eşleşmeyi sağlarız. 
-- % bir veya daha fazla karakteri temsil eder. Belki hiç karakter de olamayabilir.
-- _ tek bir karakteri temsil eder.
-- like operatörü büyük küçük harf duyarlıdır. '%a%' ile '%A%' farklı sonuçlar getirir.

select *
from customer
where first_name like 'Ann%'; --Ann ile başlayanlar.


select *
from customer
where first_name like 'Be__'; -- Be ile başlayıp sonrasında iki karakter olan

select * 
from film 
where title like '%a%v%'; -- title sütunundaki değerin herhangi bir yerinde a ve v harfi olanlar.

--alıştırma
select *
from customer
where first_name like '_her%' or last_name like '_her%';