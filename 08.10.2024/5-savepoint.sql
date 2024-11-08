-- savepoint

--savepointler bir transaction içinde bazı güvenli noktalar oluşmasını sağlar.
-- yani diyelim bir noktada sıkıntı yaşadık. bazı işlemler yaptık. Şu işleme kadar koru yaptıklarımı geri kalanı rollback yap
-- diyebiliriz.

-- bir transaction içinde birden fazla savepoint kullanabiliriz. 
-- rollback to savepoint a => dersek a noktasına kadar geri alır ama sadece rollback dersek bütün işlemleri geri alır.

begin;
	insert into tablo_adi values(value1);

	savepoint recep;

	insert into tablo_adi values(value2);

	savepoint emin;

	update tablo_adi set col1 = val1;

rollback to savepoint recep; -- diyelim ki update de bir sorun oldu recep noktasına dön demiş olduk. Böylece recep noktasının 
-- altında kalan işlemler geri alınacak

-- ne zaman transaction son bulur commit ettiğimizde, rollback yaptığımızda ya da connection koptuğunda eğer işletim sistemi bizi 
-- atarsa veritabanı bunu algılar ve rollback yapar.


