-- tarih fonksiyonları

--age: iki tarih arasındaki farkı veriyor yıl, ay ve gün bazında interval olarak verebiliyor.
select age(timestamp '2023-08-10');
--Kodunda timestamp '2023-08-10' ifadesi, belirtilen tarihin saat kısmı olmadan tam tarih ve zaman biçiminde ele alınmasını sağlar. 
--Yani, 10 Ağustos 2023 tarihini tam bir zaman damgası olarak kullanıyorsun. 
--age() fonksiyonu bu zaman damgasını alarak, geçerli tarih ile 10 Ağustos 2023 arasındaki farkı hesaplar.
--select ad,tarih,age(now(),tarih) from kitaplar
SELECT age('2024-09-12', '1990-05-15');

-- localtime: şu an hangi andaysak onun zamanını verir.
select LOCALTIME;

--date_part: Bir tarih içindeki ay yıl gün gibi değerleri almaya yarar. double döner
select date_part('YEAR',CURRENT_DATE);
select date_part('MONTH',CURRENT_DATE);
select date_part('DAY',CURRENT_DATE);
select date_part('CENTURY',CURRENT_DATE); --YÜZYIL
select date_part('QUARTER',CURRENT_DATE); --ÇEYREK
select date_part('DECADE',CURRENT_DATE); --ON YIL
select date_part('DOY',CURRENT_DATE); --Yılın hangi günü. 275

--extract: Bir tarih içinden yıl ay gün değerlerini çekmeye yarar. numeric döner
select EXTRACT(CENTURY from current_date);
select EXTRACT(QUARTER from current_date);
select EXTRACT(DECADE from current_date);
select EXTRACT(YEAR from current_date);
select EXTRACT(DOY from current_date); -- DOY: DAY OF YEAR demek

--timeofday: Bugünün tarihini ayrıntılı olarak verir.
select timeofday();

--now: şu anı tarih ve zaman şeklinde veriyor
select now();

--current_date: bugünün tarih değerini getiriyor.
select current_date;

--current_time: şu anki çalıştığı zamanı veriyor
select current_time;

--date_trunc: truncate işlemi yapar. Yani yıl olsun, çeyrek olsun, saat olsun. O zaman dilimini verilen değerin başına getiriyor.
select date_trunc('quarter',TIMESTAMP '2024-08-20'); -- "2024-07-01 00:00:00". Yıl 4 çeyrekten oluşuyor ya bugünün 
--tarihinde(1.10.2024) 3. çeyrekte olduğumuz için 3. çeyreğin başındaki tarihe getirdi.
select date_trunc('year',TIMESTAMP '2024-08-20'); -- "2024-01-01 00:00:00". 2024 yılının başına getiriyor. 

