-- alt sorguların kullanımı
-- Bir alt sorgu ana sorgudan önce çalıştırılır.
-- parantezle kapatılıp diğer sorgulardan ayrılırlar.

-- çeşitleri vardır. Tek satır ve çok satır sonuç dönen. Tek satır sorgular bir satır ve bir sütun değer döndürürler. 
-- Birden fazla sütun dönerse o tek satır sorgu olmuyor.
--örnek
select * from employees where salary > (select avg(salary) from employees)

--alt sorguyu where cümlesinde kullanma
select * 
from city 
where country_id = (select country_id from country where country='Japan');

select title,length,rating 
from film 
where (length,rating) = (select length,rating from film where title='Home Pity'); --normalde = gibi karşılaştırma ifadelerinde
-- bir sütun dönmesi lazım ama bu şekilde de birden fazla sütun dönecek şekilde ayarlayabiliyoruz.
/*
Burada subquery (select length, rating from film where title='Home Pity') Home Pity 
filmine ait length ve rating değerlerini döndürür, örneğin 120, 7.8.

where (length, rating) = (120, 7.8) koşulu, length = 120 ve rating = 7.8 olan tüm filmleri seçer.
*/

-- alt sorguyu sütunda kullanma
select first_name,last_name,
	(
		select department_name from departments d 
		where d.department_id = e.department_id
	) dep_name
from employees e;

-- having de kullanma
select department_id, count(*) 
from employees 
group by department_id
having count(*) > (select count(*) from employees e where e.department_id = (select department_id from departments d where d.department_name = 'IT'));


--birden fazla satır getiren alt sorgular
--table gibi davranırlar from ve where ifadelerinde kullanılırlar. Sütun olarak kullanılmazlar. where ile kullandığımızda
-- in, any, all ifadeleri ile kullanılırlar.

--in
select * 
from employees 
where job_id in (select job_id from jobs where 5000 between min_salary and max_salary);


--alıştırma: in ifadesini iki sütun için kullandık.
select * 
from film gf
where rating = 'G' and (gf.rental_duration, gf.length) in 
	(
		select lf.rental_duration, lf.length from film lf where length>170
	)

-- any: =, <, > gibi ifadelerle kullanılırlar.
-- eğer column_name < any () ifadesi varsa any ifadesi ile en büyük değer gelir. sütun değeri bu büyük değerden küçük olmalı diyordu
-- eğer column_name > any () ifadesi varsa any ifadesi ile en küçük değer gelir. sütun değeri bu küçük değerden büyük olmalı diyordu
-- eğer column_name = any () ifadesi dersek bu in ile aynı işi yapar.
select * 
from employees 
where salary < any(select salary from employees where job_id=9);

--all: =, <, > gibi ifadelerle kullanılırlar.
-- eğer column_name < all () ifadesi varsa bu ifadedeki en küçükten daha küçük verileri getir demek
-- eğer column_name > all () ifadesi varsa bu ifadedeki en büyükten daha büyük verileri getir demek
-- eğer column_name != all dersek de bu da not in e karşılık geliyor.
select *
from employees where salary > all 
	(
		select salary from employees where manager_id = 1
	);

-- exists: sorguyu kontrol eder ve true döner ve alt sorgudaki arama işlemini sonlandırır. false olduğu sürece aramaya devam eder.
--where sorgusundan sonra gelir direk exists ifadesi
select * from customer c
where exist 
	(
		select 1 from payment p where p.customer_id = c.customer_id -- neden 1 yazdık. exist de bir sütuna ihyiyaç olmuyor ama 
		--select sorgusu yanında bir sütun olmadan 
		-- çalışmaz biz de dummy column(aptal sütun- hiçbir önemi olmayan sütun) ekledik
	)

--not exists: olmayan değerleri getirir.
select * from employees e
where not exists 
	(
		select 1 from jobs j
		where lower(job_title) like '%manager%'
		and e.job_id = j.job_id
	)