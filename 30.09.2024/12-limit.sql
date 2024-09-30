-- limit operatörü

-- opsiyonel ifadedir. select sorgusundan gelen verilerden kaç tanesini ekranda göstermek istiyorsun. sql deki top 5 gibi
-- limit sıfırsa o zaman veriler dönmez.

-- offset de şu kadarını atla diyor. where sorgusundan sonraki limit kullanımı postgresql e özeldir.
select *
from table_name
order by salary
limit 10 offset 5; -- 10 tanesini getir. Bu select sorgusundan 5 tanesini atla demiş olduk offset ile. Sonraki 10 tanesini getirir.

select *
from actor
order by first_name,last_name
limit 5;

select film_id, title
from film
order by film_id
limit 8 offset 4; -- 8 tanesini getir. Bu select sorgusundan 4 tanesini atla demiş olduk offset ile. Sonraki 8 tanesini getirir.