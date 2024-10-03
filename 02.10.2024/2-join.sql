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
select * from film f left join inventory i on f.film_id = i.film_id 

--right join: sağdaki tablonun tüm değerlerini getirir. soldaki eşleşmiyorsa soldaki değer null getirilir.
select * from movies m right join movie_reviews mr using(movie_id)

-- full join: İki tabloda da eşleşmeyen veriler olsa da getirilip solda ve sağda da null değerler olur.
select * from x full outer join y using(id)

--self join: Bir tablonun kendisi ile birleştirilmesi
select * from table_a inner join table_a on predicate; -- self join kullanmıyoruz. inner, left, right join ile aynı 
--tabloda kullanıyoruz.
select * from employees e inner join employees e_ on e.manager_id = e_.employee_id;

--alıştırma
-- film tablosundaki aynı uzunluğa sahip olan filmleri getir. Aynı id leri tekrar getirmeye gerek yok.
select * from film f1 inner join film f2 on f1.film_id <> f2.film_id and f1.length = f2.length

--aynı şehirde yaşayan müşteriler


-- cross join: İki tablonun eleman sayılarını çarparak bütün olasılıklarının hesaplandığı birleştirme
select * from address cross join city; --dikkat et herhangi bir şart yok
select * from address inner join city on true; -- bu da aynı şey
select * from address,city -- bu da aynı şey

--natural join:
-- İki tabloyu birleştirirken bu iki tablodada ortak olan sütunu yazmadan otomatik kendi seçiyor.
select * from t1 natural join t2; -- * kullanınca ortak sütunlar bir kez diğerleri normal bir şekilde gelir sorguda
-- eğer ortak sütun yoksa cross join yapar. Eğer birden fazla ortak sütun varsa ve
-- birebir aynı tipte değilse(mesela bir sütunu tarih ve zaman var diğerindeki sütun sadece tarih gibi) iki tabloda o zaman sorgu sonucu boş döner.
