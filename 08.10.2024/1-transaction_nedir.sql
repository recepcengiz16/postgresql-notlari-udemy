-- transaction nedir
-- Bir veya daha fazla işlemin bir işlem altında toplanmasıdır aslında. Bir veya daha fazla değişikliğin veritabanına
-- uygulanmasıdır.
-- Hangi sorgular peki bunlar create, update ve delete işlemleri. Yani bir işin tamamını yaparsın ya da yapmazsın manası var.

--sql komut tipleri:
-- dql => data query language: sorgulama dili olarak sadece select vardır.
-- ddl => data defination language: create, alter, drop, truncate ve rename. Bunlar veritabanı nesnelerinde değişiklik yapmamızı,
-- isimlendirmemizi. Ve veritabanı nesnelerini oluşturma işine yarar.
-- dml: data manuplating language: select, insert, update, delete komutları vardır. select bazı dokümanlarda dql olarak geçiyor
-- bazı dokümanlarda dml içinde geçer. Kayıt ekleme, silme ve güncelleme işlemlerini yaparız.
-- dcl: grant ve revoke. Veritabanı nesnelerine yetki alma ve yetki verme işlemleri yaparız.
-- tcl: commit, rollback ve savepoint komutlarıdır. transactionda kullanılır.

-- database transaction işlemleri aşağıdaki işlemlerle başlar:
-- ddl: data defination language: create, alter, drop, truncate ve rename. Bir objeyi başka bir objeye bağlama da var bunda. Bu 
-- işlemler başladığında transaction başlar.
-- dml: data manuplating language: select, insert, update, delete komutları vardır.
-- dcl: data control language. Yetki verme işlemleri

--transaction ların özellikleri:
-- Bütünlük: Bir transaction işlemi ya başarılıdır, ya da başarısız olur.
-- tutarlılık: Veritabanındaki veriler transaction sonrasında tutarlı olmalıdır.
-- izole: transaction işlemlerinin birbirinden bağımsız olarak ilerlemesi. Bir transaction başka birini kısıtlamamalı.
--dayanıklılık: Sistemde arıza olduğunda işlemleri geri alabilmelidir.




