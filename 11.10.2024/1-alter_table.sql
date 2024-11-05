-- alter ile tabloda güncelleme yapma

--alter ile bir tabloya sütun ekleme
alter table tablo_adi -- bir tablonun yapısını değiştirirken alter table ile başlarız her zaman
add column sutun_adi datatype column_constraint

--tek sütun ekleme
alter table staff 
add column email varchar(100);

alter table staff
add column salary numeric(8,2) default 0;

-- çok sütun ekleme
alter table movie_reviews
add column review_date date,
add column last_update date default current_date

-- sütun ismini değiştirme
alter table tablo_adi
rename column sutun_adi to new_sutun_adi

alter table movie_reviews
rename column review_date to user_review_date

--sütunun default değerini değiştirmek
alter table tablo_adi
alter column sutun_adi
[set default value_ | drop default] -- bu şekilde ya güncelleme ya da silme yaparız.

alter table movie_reviews
alter column review
set default 'Good'; -- önceki eklenmiş null değerlere dokunmadı. Bundan sonrakiler default olarak bu olacak demiş olduk.

alter table movie_reviews
alter column review_rate
drop default;-- default değeri kaldırıyoruz. Bu zamana kadar vermiş olduğumuz default değerlere dokunmaz. Bundan sonra default değer
-- olmayacak demek.

-- sütunun veri tipini değiştirmek: Tablo şçindekş veriler dönüştürülecek tipe uyumlu olmalıdır. Karakter sayısı önceden 200 iken
-- sonradan 50 yapamayız. Çünkü yeni tipe uyumlu değil.
alter table tablo_adi
alter column sutun_adi1 [set data] type new_type, -- set data opsiyonel
alter column sutun_adi2 [set data] type new_type

--sütunun tipini değiştirme
-- tek sütun
alter table courses
alter column description type text;

-- çoklu sütun
alter table budgets
alter column current_year type smallint,
alter column previous_year type int;

-- dokümantasyon amacıyla bir tabloya yorum ekleme. Bu tablo şunun için oluşturulmuştur.
comment on table tablo_adi is 'Bu tablo şunun için oluşturulmuştur.'

-- aynı şekilde sütun için de olanı var.
comment on column cars.brand is 'Bu sütun bunun için oluşturuldu'


-- null ekleme ve kaldırma
alter table tablo_adi
alter column sutun_adi
[set not null | drop not null];

--not null eklemesi
alter table movie_reviews
alter column review_rate set not null; -- eğer null değerler varsa o sütunda hata verir.

--not null kaldırması
alter table movie_reviews
alter column review_rate drop not null;

--drop columns: tablodan sütunları kaldırır.
alter table tablo_adi
drop column sutun_adi1,
drop column sutun_adi2 -- birden fazla olursa da , ile ayırıp diğerini de silebiliriz.

alter table movie_reviews
drop column review_rate;

-- check constraint: bir sütunun alması gereken değerlerin sınırlanması için vardır. Örneğin count sütunu 1-10 arasında 
--değer alacak diye
alter table tablo_adi
add check expression_;

alter table tablo_adi
add check (review_rate between 1 and 5)


--tabloya constraint ekleme
alter table tablo_adi
add constraint constraint_adi constraint_defination

--örnek
alter table courses
add constraint uq_courses unique (course_name) -- hani tabloyu oluştururken sütunun yanına yazıyorduk ya kısıtlamayı mesela unique
-- orada ismini postgresql veriyor burada da aynı şey sadece ismini biz vermiş oluyoruz	

--tablodan constraint silme
alter table tablo_adi
drop constraint constraint_adi

--örnek
alter table courses
drop constraint uq_courses;

--tablo ismini değiştirme
alter table tablo_adi
rename to new_table_name

-- tabloyu kaldırma
drop table if exists tablo_adi 
[cascade | restrict]; --eğer hiçbir şey yazmazsak cascade ya da restrict diye bu tablo default olarak restrict oluyor. 
-- O zaman ne oluyor. Bu tabloya bağlı nesneler varsa ilişkili o zaman silmiyor bu tabloyu restrict olunca da.


--örnek
drop table tablo_adi1,tablo_adi2;

drop table tablo_adi cascade; -- Eğer cascade şeklinde yaparsak o zaman bağlı olduğu tablodan foreign key kısıtlamasını
-- kaldırsın ki diğer tabloda ilişkisi olmasın o şekilde de bu tabloyu silebilsin. Kaç tane tablo varsa bağlı olduğu
-- hepsinden kaldırıyor kısıtlamayı. Bu tabloya yabancı anahtarlarla bağlı başka tablolar varsa, 
-- bu tablolar veya onların ilgili satırları da silinir.

