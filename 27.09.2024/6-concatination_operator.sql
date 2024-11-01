-- concatenation operator(||): sütunlar ya da karakterler arasında bir birleştirme işlemi yapar. Postgresql de vardır.

select country_id || ': ' || countryname 
from country; -- iki farklı sütunu birleştirdik. '45: Germany' gibi

--exercises
-- 1) isim ve soyisimleri birleştirip mail adresi oluşturma ve %35 zamlı maaş
select first_name || '.' || last_name || '@hotmail.com', (salary * 1.35)
from employees;

