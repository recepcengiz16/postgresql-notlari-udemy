-- distinct komutu: tekrar eden satırları elemek için kullanılan bir komuttur.
-- select den hemen sonra yazılır. Arkasından bir veya daha fazla sütun yazılabilir. Her birini kontrol eder duplicate veri mi diye.

-- birden fazla sütunda ise distinct de iki tane aynı sütunlu varsa getirmez. Örneğin Bursa Nilüfer 2 tane ise onu 1 kere getirir.
-- Ama Bursa Nilüfer ve Bursa Osmangazi şeklinde ise distinct il ve ilçe o zaman ikisine göre yaptığı için ve bu sefer ikisini 
--de getirir

select DISTINCT special_features 
from film; -- select den hemen sonra gelir.

select * from address;

select distinct film_id,store_id from inventory order by 1,2;