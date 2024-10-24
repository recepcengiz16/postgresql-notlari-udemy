-- indexlerin kaldırılması
drop index [concurrently] [if exists] index_name [cascade | restrict]; -- cascade ile bağlı olan objeleri de drop edebiliyoruz
-- restrict ile de bağlı olan obje varsa bunun drop edilmesine müsaade etmiyoruz. defaultu budur. Yazmasak da default olarak bunu yapar
-- bağlı olan obje varsa bu işlemi yapmaz.

-- concurrently de bir tabloda normalde index oluştururken ya da silinirken ilgili kayıtlar kilitlenir. 
-- eğer işlem sırasında başka bir işlem geldiyse (insert,update,delete gibi) o işlemler işleme alınır belli bir sıraya alınır ve
-- index işlemi ona göre organize edilir.

drop index idx_emp_job_id;