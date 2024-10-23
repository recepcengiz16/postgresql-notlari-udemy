-- unique index
/*
	uniquelik sağlayan index türüdür. Bir veya daha fazla sütunun unique olmasını zorlarlar. Normal indexte uniquelik yoktur.
	Tablo create edildikten sonra yaptığımız bir şey. Eğer unique index create edilirken tabloda aynı kayıttan varsa o sütunda
	o zaman hata vericektir.
*/

--syntax
create unique index index_name
on tablo_adi(sutun_adi, [...])

--örnek
create unique index idx_employees_email
on employees(email)

-- birden çok sütun için örnek
create unique index idx_cust_name
on customer(first_name,last_name,email); -- bu şekilde yaptığımızda adı soyadı ve emaili aynı olan sütun eklenemez ve güncellenemez.

