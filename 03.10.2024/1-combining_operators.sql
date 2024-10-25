-- combining operators(birleştirme operatörleri):
-- birden fazla select cümlesini birleştirmede kullanılır. Veri tipleri uyumlu olmalıdır. Sütun sayıları aynı olmalıdır.  
-- İki tane yazdıysan diğerinde de iki tane sütunu yazman lazım. Sıralamada da aynı veri tipleri olmalı

-- union: İki verisetini birleştirir. Tekrar eden değerleri bir kez getirir.
select * from table_a
union
select * from table_b

--alıştırma
select title,rating from film where rating='PG'
union
select title,rating from film where special_features::varchar like '%Trailers%';

--union all: İki verisetini birleştirir. Tekrar eden değerleri de getirir.
select 'SQL1' as sq1,first_name,last_name from table_a
union all
select 'SQL2' as sq2, first_name,last_name from table_b -- 'SQL1' as sq1 diyerek de hangi sorgudan gelmiş 
-- olduğunu anlamamızı sağlamak için böyle bir şey de yazabiliriz. Bunu sadece union all da yap yoksa union da bu sütunları da 
-- farklı satır olarak algılayacağı için union all gibi olur o da

--intersect: iki veya daha fazla olan sorgudaki kesişim kümesini verir. uniondan farkı union ortak satırları bir kez getiriyordu
-- intersect bu ortak satırları getiriyor.
select city from table_a
intersect
select city from table_b

--except: ilk sorgunun diğer sorgudan farkını getirir. Bu yüzden hangi sorgunun farkını istiyorsak onu üste yazmalıyız.

select city from table_a
except
select city from table_b

select film_id,title from film
except
select i.film_id,title from inventory i inner join film f on i.film_id= f.film_id 
order by film_id;