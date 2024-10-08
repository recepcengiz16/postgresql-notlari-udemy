-- transaction ın başlaması
-- postgresql kurulumda autocommit olarak gelir yani yaptığımız tüm işlemler kalıcı olarak veri tabanına yansır.

-- Bir transaction begin, begin transaction, begin work gibi komutlarla başlar.
--commit: Yaptığımız değişiklikleri veritabanında kalıcı olarak saklar. commit, commit transaction, commit work
-- Bizim yaptığımız transaction işlemleri ramde yapılır ve bunu başka kullanıcılar göremezler. commit de eklenen kayıtları 
-- disklere yazar. commit komutu ile kalıcı hale gelmiş olur veriler.
-- rollback: yapılan işlemleri hiç yapılmamış gibi geri alır. rollback, rollback transaction, rollback work gibi komutları
-- yazabiliriz.