-- Şartlı fonksiyonlar
--select coalesce(exp1,exp2...) gönderilen parametrelerden ilk null olmayanı döner. Hepsi null ise null döner.
-- gönderilen parameterlerdeki veri tipleri birbiri ile uyumlu olmalı

select coalesce(1,2,3);
select coalesce(null,2,3);

select coalesce('05055055050','No phone number'); -- eğer ilk değer boşsa bizim istediğimiz değeri döndürebiliriz 
--ama iki veri tipi de aynı olmalı.

--alıştırma
select *, coalesce(price-discount,price) 
from cars;

-- nullif(exp1,exp2); iki tane parametre alır. exp1=exp2 ise sonuç null dır. Ama eşit değilse sonuç olarak exp1 döner.
--veri tipleri birbiri ile uyuölu olmalıdır.
select nullif(1,1); -- sonuç: null
select nullif(1,2); --sonuç: 1
select nullif('A','B');
