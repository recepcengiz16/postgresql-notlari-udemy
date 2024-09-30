-- not operatörü: verilen şartın değilini getirir.
select *
from employees 
where manager_id not in(100,108,114);

select * 
from employees
where first_name not like 'A%'; 

--alıştırma
select *
from employees
where not(salary between 4000 and 7000) and job_id != 16 ;