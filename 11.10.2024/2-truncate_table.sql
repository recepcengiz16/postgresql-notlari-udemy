-- truncate table: bir tablodaki bütün datayı siler
-- Asla geri döndürülemez. Ama delete i transaction içerisinde geri alabiliriz.

-- delete mantığı veriler geri gelecek mantığıyla çalıştığı için loglar bu yüzden yavaştır.
-- Ama truncate öyle değildir. Çok hızlı çalışır.

truncate table tablo_adi1, 
tablo_adi2 --gibi birden fazlasını da silebiliriz verinin.
restart identity; -- eğer serial olarak tanımlanmış sütunlar varsa bunların counterlarını sıfırlar. Opsiyoneldir. Eğer bunu koymazsak 
-- kaldığı yerden devam ediyor counterı ;