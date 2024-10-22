-- constraints: Kısıtlamalar
-- kısıtlama sağlar ve table seviyesinde bazı kuralların uygulanmasını zorlar.
-- Verilerin silinmesi sırasında bağımlılıkları kontrol ederler. Eğer bir veri başka veriye bağlıysa onu engellerler.
-- Yanlış data girilmesini engellerler ve uniquelil sağlarlar.
-- Table ve sütun seviyelerinde konulabilirler.

--constraint tipleri
-- primary key: bir tabloda bir tane vardır. Ve Uniquelik sağlarlar. 
-- foreign key: iki tablo arasında bağlantı sağlarlar.
-- check: veri girişinde ve güncellemede sütundaki değerin kontrolünü sağlarlar.
-- unique: bir veya daha falza sütunun benzersiz olmasını sağlayabiliriz.
-- not null: bir sütunun null olmaması gerekliliğini sağlar.

-- constraintlerde performans sıkıntısı olabiliyor. Milyonlarca satırı insert ya da update ederken sürekli bir kontrol olduğu için
-- yavaş çalışacaktır.