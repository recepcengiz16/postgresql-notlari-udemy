-- string fonksiyonlar:
--lower: stringdeki ifadeleri küçük harfe dönüştürür.
select lower('BABA');

--upper: stringdeki ifadeleri büyük harflere dönüştürür.
select upper('ismail');

--initcap: kelimelerin baş harflerini büyük yapar.
select initcap('MERHABA KARDEŞİM');

-- Bunları sadece select de değil şart içinde de yazabiliriz.
select *
from film
where lower(title) like '%trip%';