-- alias: var olan bir sütuna ya da bizim oluşturduğumuz bir sütuna yeni bir isim vermemizi sağlar.
select first_name || ' ' || last_name as full_name -- as kullanabilirsin ya da kullanmazsın
from employees;

select salary::decimal from employees; -- :: casting işlemidir. o sütunu o cinsten almamızı sağlar.