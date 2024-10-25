-- aggregate fonksiyonlar
--mssql de ve oracle da grup fonks. olarak geçer. aggregate fonks. lar null değerleri atlayarak işlem yaparlar.
-- Yalın sütunlarla çalışmazlar.

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
select min(salary) from employees;
select min(first_name) from employees; -- alfabetik olarak sıralar ve ilk değeri getirir.
select min(hire_date) from employees; --tarihdeki min değer

--max: verilen değerlerin max. bulur.
select max(salary) from employees;
select max(hire_date) from employees; --tarihdeki max değer
select max(first_name) from employees; -- alfabetik olarak sıralar ve son değeri getirir.

--count: verilen değerlerin sayısını bulur
-- count(*) hiçbir şart olmadan bütün satır sayısını döner, 
-- count(column): parametredeki column u null olmayan satırları sayar
-- count(distinct column): tekrar eden satırların sadece 1 er tanesini sayacak şekilde sonucu döner.
select count(*) from actor;
select count(phone_number) from employees;
select count(distinct job_id) from employees;

--alıştırmalar
select 
	min(length(first_name || last_name)) minumum,
	max(length(first_name || last_name)) maximum,
	round(avg(length(first_name || last_name)),2) ortalama
from employees;

--group by: verileri gruplamada kullanılır.
--select içinde yazılan diğer yalın sütun isimleri group by içinde olmalıdır.
-- group by içinde olanlar select içinde olmak zorunda değil. Ama koymazsan da neye göre grupladığın tabloda olmaz 
-- güzel bir görüntü olmaz. 
-- Column aliaslar group by içinde kullanılamazlar
-- null olanlar da sorguya dahil edilir.

-- birden çok sütuna göre gruplama. Önce ilk sıradakine göre sonra diğerlerine göre gruplar.
select 
	column1,
	column2,
	aggregate_function(column3)
from
	tablo_adi
group by
	column1,
	column2

-- tek columna göre gruplama
select 
	job_id,
	count(*) nmbr,
	min(salary),
	max(salary)
from employees
group by job_id,
order by 1

--alıştırma
select distinct rating from film;


-- having: group by ile yapılan sorgularda şart yazmak için vardır. where ile çalışmıyor aggregate fonks.
select 
	column1,
	aggregate_function(column2)
from tablo_adi
	group by column1
	having group_by_exp
	order by column1

--alıştırma
select customer_id, count(*) as adet
from rental
group by customer_id
having count(*) > 35
;


select department_id,
	count(*) as num_of_emps,
	case 
		when count(*) <=3 then 'Small Room'
		when count(*) between 4 and 6 then 'Medium Room'
		when count(*) >6 then 'Big Room'
	end duration
from employees
group by 1
order by 2;

	