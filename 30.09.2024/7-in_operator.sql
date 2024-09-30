-- in operatörü: Elimizdeki veri listesinde birden fazla kayda göre aramasını yap oluyor

select *
from customer
where first_name in ('Kelly','Tracy');


select * 
from customer
where address_id in (10,20,30)