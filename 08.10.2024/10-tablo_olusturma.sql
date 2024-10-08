-- tablo oluşturma
-- script ile
create table if not exists tablo_adi ( -- if not exists opsiyonel
	col_name_1 datatype_ constraint_,
	col_name_2 datatype_ constraint_,
	col_name_3 datatype_ constraint_,
	table_constraints -- tabloların kısıtlamaları
)

create table educations (
	education_id serial primary key, -- serial autoincrement olarak 4 bytelık 1'den başlayarak auto artıyor.
	education_name varchar(100) not null unique, -- 2. bir eğitim ismi aynı olamaz unique ile.
	description varchar(500),
	start_date date,
	end_date date
)

select * from educations;

-- select into
-- create table as