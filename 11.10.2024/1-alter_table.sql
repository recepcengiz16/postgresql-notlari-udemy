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

alter table movie_reviews
alter column 
