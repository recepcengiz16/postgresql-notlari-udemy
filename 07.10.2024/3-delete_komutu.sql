-- delete kullanımı: tablodan satırları silmek için kullanılır.
delete from tablo_adi 
where condition_ -- where şartı olmazsa tablodaki tüm satırlar silinir.
returning select_list | *; -- silmeden önce cache e alıp öyle getiriyor silinen satırları

--tek satır
delete from basket_c
where id_c = 5;

-- çoklu satır
delete from basket_c
where id_c in (8,9);

--returning
delete from colors 
returning *;

delete from student where id=17
returning name,course_name;

--delete join: join işleminde araya using geliyor. update de from geliyordu hatırlarsan
delete from t1
using t2 -- ikinci tabloyu using diyerek kullanıyoruz.
where t1.id = t2.id
returning returning_columns;

-- örnek
delete from movies m
using movie_reviews mr
where mr.movie_id = m.movie_id

-- örnek
delete from product p
using product_segment ps
where p.segment_id = ps.id and ps.segment='Luxury';