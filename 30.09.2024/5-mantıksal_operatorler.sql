--mantıksal operatörler: and, or, not

--and
select * 
from film
where length>100 and rental_duration<5; --and operatöründe her iki durumun da sağlanması lazım

--or
select *
from payment
where staff_id=2 or amount>5; -- şartlardan biri true olması yetiyor. Her iki durumun da sağlanmasına gerek yok.

-- not
select * from film where not length <100; -- cevabın tersini getirir.