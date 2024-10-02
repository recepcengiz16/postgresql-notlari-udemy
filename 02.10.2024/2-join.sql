-- tablo aliasları
-- tablo_adi as alias_name

-- join: tablo birleştirme işlemleri için kullanılır

--inner join: iki veya daha fazla tablonun birleştirilmesi için kullanılır. Kesişimlerini getirir.
select * 
from basket_a a
inner join
basket_b b
on a.fruit_a = b.fruit_b -- hangi tablolarda

-- using: eğer join ettiğimiz tabloların sütun isimleri aynı ise using kullanırız. yani on yerine using kullanırız. Her iki tabloda
-- da bu isim ortak ya. Bir güzel özelliği de normalde customer_id yi alias ile yapman lazımdı on ile kullanınca ama buna gerek
-- kalmıyor.
select customer_id,first_name 
from customer
inner join
payment 
using(customer_id)

--alıştırma:
select first_name,last_name,department_name from employees inner join departments using(department_id);

--left join: soldaki tablonun tüm değerlerini getirir. sağdaki eşleşmiyorsa sağdaki değer null getirilir.
--right join: sağdaki tablonun tüm değerlerini getirir. soldaki eşleşmiyorsa soldaki değer null getirilir.
-- full join: İki tabloda da eşleşmeyen veriler olsa da getirilip solda ve sağda da null değerler olur.
--self join: Bir tablonun kendisi ile birleştirilmesi
-- cross join: İki tablonun eleman sayılarını çarparak bütün olasılıklarının hesaplandığı birleştirme