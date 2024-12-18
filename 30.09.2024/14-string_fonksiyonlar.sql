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

--alıştırma
select upper(title) as title_new, lower(description) as description_new 
from film
where description ilike '%DRAMA%Australia%';


-- concat: bir veya daha fazla stringi birleştirir
select concat('Merhaba','Recep'); 
select concat('Merhaba',' ','Recep'); -- bu da başka bir versiyonu

-- concat_ws: iki stringi birleştirirken ilk parametre ile aralarına koyarak birleştirir.
select concat_ws('*','Merhaba','Recep'); -- ws with seperator demek

--left: soldan n karakter alır.
select left('Merhaba',3);

--rigt: sağdan n karakter alır.
select right('Merhaba',2);

-- length: string ifade kaç karakterden oluştuğunu ifade eder.
select length('denemeler');

-- lpad ve rpad: sabit uzunlukta string oluşturur.
select lpad('Sol',5,'*'); -- eksik olduğu için 5 karaktere tamamladı ve sol tarafına geri kalan karakter kadar * ekledi. 
select rpad('Sağ',5,'*'); -- eksik olduğu için 5 karaktere tamamladı ve sağ tarafına geri kalan karakter kadar * ekledi.
-- Eğer fazla olursa karakter sayısı belirttiğimiz sayıdan o zaman da belirttiğimiz sayı kadar karakteri döner sağdan veya soldan
-- ve belirtilen karakteri de eklemez.

--replace: bir string ifadede istenilen değerleri başka bir değerle değiştirir.
select replace('Merhaba','a','e'); -- büyük küçük harf duyarlıdır.

-- split part: string ifadede verdiğimiz ayraca göre parçalara ayırır. Ve istediğimiz parçayı bize döner.
select split_part('Merhaba,ben,recep',',',2);

SELECT SPLIT_PART('2024-10-24', '-', 1) AS yil,
       SPLIT_PART('2024-10-24', '-', 2) AS ay,
       SPLIT_PART('2024-10-24', '-', 3) AS gun;

-- substring: belirli karakterden itibaren şu kadar karakter getir demiş oluyoruz.
select substring('Merhaba',2,3); -- 2. karakterden itibaren 3 karakter getir. indis 0 dan değil 1 den başlar.

-- position: bir stringi başka bir string içinde arar ve ilk bulduğunun indisini döner
select position('Bursa' in 'Bursa güzel bir şehir. Bursa büyük bir şehir.');

-- reverse: verilen ifadeyi terse çevirir.
select reverse('merhaba');

