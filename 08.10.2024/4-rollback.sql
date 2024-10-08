-- rolback
begin;
	insert into tablo_adi values(value1);
	update tablo_adi set col1 = val1 where id=5;
rollback; -- istemediğimiz sonuçlarda verileri diske yazmaz geri alır.

-- rollbackin eksi sonuçlarından biri identity sütunlarda işlem geri alındığında identity değer artıp geri eski değere
-- dönmediği için o sütunda idler arasında boşluk kalabiliyor.