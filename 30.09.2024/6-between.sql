-- between operatörü: belirli aralıktaki şartların sağlanması için vardır. 

select *
from employees
where salary BETWEEN 5000 and 10000;

select *
from film
where length between 100 and 120; -- sınırlar dahil aralığa 100 ve 120 dahil yani

--between ile sayısal, string ve tarihsel arama yapabiliriz.
select * 
from employees
where hire_date between '2017-01-01' and '2017-12-31'
order by hire_date;

select * 
from employees
where first_name between 'A' and 'E'
order by first_name;

--alıştırma
select * 
from staff 
where '2022-05-01' between hire_date and departure_date; -- bu şekilde de oluyor bu tarihi diğer sütunlardaki değerler arasında ara.
