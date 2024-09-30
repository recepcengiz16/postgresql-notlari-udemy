-- distinct on: Bir gruplama içindeki ilk satırları getirmeye yarar.

select distinct bcolor,fcolor 
from distinct_demo
order by bcolor,fcolor;

select distinct on(il) il,ilce 
from adresler
order by il,ilce; -- tekrar gruplamak istediğim column ismini yazıyorum distinct on(sütun adı). Yani normalde diyelim:
-- Bursa Nilüfer, Bursa Osmangazi, İstanbul Esenler, İstanbul Avcılar gibi satırları Bursa hep tekrar ettiği için 
--tekrar eden Bursa ve İstanbul satırlarında da ilk sıradakini alıyor.
-- yani Bursa Nilüferi alır ve İstanbul Esenleri alıp sıralamaya devam eder.

select DISTINCT on(bcolor) bcolor,fcolor from distinct_demo order by bcolor,fcolor;

--alıştırma
select distinct rating from film;