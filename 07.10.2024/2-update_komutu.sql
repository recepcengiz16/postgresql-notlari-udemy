-- update kullanımı
update tablo_adi set col1=value1,col2=value2 where condition_
returning * | column_; -- where şartı olmasa bütün tabloyu günceller. returning ile de güncellediğimiz verinin son halini alabiliyoruz.

--update guncellemis_adet diye mesaj çıkyor ya ona da bak kaç kayıt güncellendi diye.

--tek satır
update students set mark = 85 where id= 3	

--birden fazla satır güncelleme: 13 ve 14 idli satırda güncelleme yaptık.
update employees 
set salary = salary + 1000,
	manager_id=22
where employee_id in (13,14)

--returning ifadesi: güncellediğimiz verinin son halini görmüş oluyoruz.
update film
set replacement_cost = 20,
	last_update = current_date
where film_id = 100
returning *;

-- updade join işlemi:
-- güncellemek istediğimiz tablonun satırlarını başka bir tablo vasıtasıyla buluyorsak bu tablodan gelen değerlere göre güncelleme
-- yap demiş oluyoruz. buna da update join deniliyor diğer ismi update from. Onu da şu şekilde yapıyoruz.

update t1
set t1.col1 = value1,
	t2.col2 = value2
from t2
where t1.column_id = t2.column_id

-- örnek
update product p
set net_price = price - price * discount
from product_segment ps
where p.segment_id = ps.id

-- güncellemek istediğim satırların sorgusunu başka bir tabloyla yapıyoruz.
update employees e
set salary = salary * 1.2
from jobs j
where e.job_id = j.job_id and lower(job_title) like '%manager%'

--örnek
update employees e
set salary = salary * 1.2
where e.job_id in 
	(
		select j.job_id from jobs j 
		where e.job_id = j.job_id and lower(job_title) like '%manager%' 
	)
