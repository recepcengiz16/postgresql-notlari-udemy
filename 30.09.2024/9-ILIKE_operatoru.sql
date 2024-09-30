-- ILIKE operatörü:
--Postgresql e ait özel bir operatördür. Like operatörü gibi çalışır. En önemli özelliği büyük küçük harfe duyarlı değildir.

select first_name
from customer
where first_name ilike 'CAR%'; -- 