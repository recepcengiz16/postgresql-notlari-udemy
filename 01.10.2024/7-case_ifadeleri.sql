-- case örnekleri ve nested fonksiyonlar
select title,length,
	case
		when length between 0 and 50 then 'Short Length'
		when length>=51 and length<=120 then 'Medium Length'
		when length>120 then 'Long Length'
		else null
	end as sart
from film
order by title;

-- case ifadesinin birden fazla column da kullanılması
select title,rating,
	case rating
		when 'G' then 'General Audience'
		when 'R' then 'Restricted'
	end as description,
	case
		when length between 0 and 50 then 'Short Length'
		when length>=51 and length<=120 then 'Medium Length'
		when length>120 then 'Long Length'
		else null
	end as sart
from film;

--alıştırma
select first_name,last_name,hire_date,salary,
	case
		when date_part('year',hire_date) between 2018 and 2020 then salary*1.25
		when date_part('year',hire_date) < 2018 then salary*1.35
		when date_part('year',hire_date) > 2020 then salary*1.15
	end new_salary
from employees;

--iç içe fonksiyonlar
-- en içteki fonksiyon ilk çalışır. En dıştaki en son çalışır. İç içe fonksiyonların veri tipleri uyumlu olmalıdır.
-- concat string döner ve length de içine string alır bunun gibi uyumluluk
select first_name,last_name,
	length(concat(first_name,last_name)) as len
from employees;