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
where (length,rating) = (select length,rating from film where title='Home Pity'); --normalder = gibi karşılaştırma ifadelerinde
-- bir sütun dönmesi lazım ama bu şekilde de birden fazla sütun dönecek şekilde ayarlayabiliyoruz. 

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



