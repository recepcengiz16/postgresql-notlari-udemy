-- veri tipleri

-- string veri tipleri
-- char(10),character(10): sabit uzunlukta bir string oluşturmamızı sağlar. Belirtilen sayıdan az karakter girilince geri kalan 
-- kadar boşluklarla doldurulucak

-- varchar(15),character varying(15): Uzunluğu değişkentir. İçindeki string ifade kaç karakterse veritabanında o kadar yer kaplar
-- eğer belirtilen sayıdan daha az olursa

-- text, varchar: İçinde çok büyük strin veriler tutar.


-- numeric veri tipleri
-- smallint: Küçük sayılar için. 2 bytleık yer kaplar. int2 ye eşittir.
-- int,integer: 4 bytelık yer tutabiliriz. int4 olarak yazılabilir.
-- bigint: 8 bytelık yer tutar. int8 e denktir.
-- smallserial: autoincerement sütun tiplerindendir. serial2 olarak da geçer. 2 byte yer tutar.
-- serial:  autoincerement sütun tiplerindendir. serial4 olarak da geçer. 4 byte yer tutar.
-- bigserial:  autoincerement sütun tiplerindendir. serial8 olarak da geçer. 8 byte yer tutar.
-- numeric(4,2): yani 4 haneli tam sayım virgülden sonra da 2 hane tutacağım ondalıklı bir sayı demiş olduk.
-- double precision: 8 bytelık ondalıklı sayı verisi tutar.
-- real: 4 bytelıktır reel sayıları tutan bir veri tipidir.
-- money: Para birimi olarak geçer. Para birimleri otomatik olarak getirilmektedir.
-- bool,boolean: Arkada 0 ve 1 ler olarak değerlendirilir. true ve false olark kullanılır.


-- tarih ve zaman veri tipleri
-- date: gün ay yıl şeklinde verileri tarih verisi tutar.
-- timestamp: date tipine zaman ekler.
-- timestamp without time zone: time zone verisi olmadan timestamp verisi tutar.
-- timestamp with time zone: time zone verisi ile timestamp verisini tutar.
-- time: saat dakika ve sn cinsinden zamanı tutar.
-- time without time zone: time zone verisi olmadan time verisi tutar.
-- time with time zone: time zone verisi ile time verisini tutar.





