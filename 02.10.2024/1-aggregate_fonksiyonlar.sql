-- aggregate fonksiyonlar
--mssql de ve oracle da grup fonks. olarak geçer. aggregate fonks. lar null değerleri atlayarak işlem yaparlar.

-- avg: ortalama bulur. genelde select ve having ile kullanılır. null olmayan değerleri sayarak ortalamasını alır.
--diyelim ki 12 tane değer geldi ve 4 tanesi null. 8 tanesini toplayıp 8 e böler.
select avg(rental_duration) 
from film;

select round(avg(rental_duration),2)
from film;

select avg(rental_duration)::numeric(10,2) 
from film;-- burada virgülden önce 10 haneye kadar hassasiyet olsun, 
--virgülden sonra 2 hassasiyet olsun dedik

--sum: verilen ifadenin ya da  sütunun toplamını bulur.
select sum(rental_duration) 
from film; -- null değerler hesaba katılmaz.

select rating, sum(rental_duration)
from film; -- group by ile kullanabilirsin aggregate fonksiyonlarının yanındaki sütunları(rating burada).
-- Zaten mantık olarak da hatalı düşünsene her satır için o sütunu toplam olarak göstercek.

--alıştırma
select sum(return_date - rental_date) 
from rental;

select (return_date - rental_date), (return_date::date - rental_date::date)
from rental;

--min: verilen değerlerin min bulur.

--max: verilen değerlerin max. bulur.

--count: verilen değerlerin sayısını bulur
-- count(*) hiçbir şart olmadan bütün satır sayısını döner, 
-- count(column): parametredeki column u null olmayan satırları sayar
-- count(distinct column): tekrar eden satırların sadece 1 er tanesini sayacak şekilde sonucu döner.
select count(*) from actor;
select count(phone_number) from employees;
select count(distinct job_id) from employees;