-- order by: select sonucunda gelen verileri sıralamaya yarar.
-- default olarak asc yani artan yönde
-- desc de azalan yönde sıralama yapar.
-- sql kodunun en altına konulur

select * from table_adi order by expression_1 asc, expression_2 desc --gibi

select * from film order by title -- tek columna göre sıralama ,belirtilmediği için asc

-- ille de select cümlesinin içinde yazmamıza gerek yok sıralayacağımız sütunu
select address, city_id from address order by address_id --gibi

select rating,title from film order by rating, length desc; -- rating burada asc oluyor. length desc olmuş oluyor. İlk önce rating e
-- göre sıralıyor daha sonra ratingi aynı olanları da length e göre desc sıralıyor 

--sıralama veritabanları için extra bir maliyettir.

-- kolon sırası da var. Mesela oluşturduğun sorguda film_id 1, film_name 2. sırada gibi. sen order by 2 dediğinde film_name
-- e göre sıralar. order by 1 dersen film_id ye göre sıralar.
select first_name, last_name, job_id, email from employees order by 1 -- first name e göre sıralar
select job_id, email,first_name from employees order by 1 -- bu sefer sırayı değiştik ve job_id ye göre sıraladı.

--nulls first, nulls last
select * from employees order by phone_number nulls last -- phone_numberdaki tüm null değerler sıralamada en sona gelsin
select * from employees order by phone_number nulls first -- phone_numberdaki tüm null değerler sıralamada bu sefer de en öne gelsin

