-- view ler
-- Bir sorguyu table gibi kullanmamızı sağlar. Karmaşık olan sorgumuzu her seferinde yazmak yerine bir table gibi sorgulatmamızı sağlar
-- table gibi dedik ama içinde data tutmazlar. select sorgusu olduğu için böyledir. Veriye olan erişimi limitler yani sadece gösterir.
-- tablo isimlerini viewde yazarak çağırırken de sadeve view çağırdığımız için güvenilir olur yazılan kod. Çünkü 
-- çağırırken tablo isimlerini değil de view ismini görürüz.

-- syntax
create [or replace] view view_name
as
query_;

--viewi çağırıken de
select * from view_name; -- where diyerek de gelen sorguyu şarta tabi tutabilirim.

-- örnek
create view vw_emp_info
as
select * from employees e
inner join jobs j using(job_id)
inner join departments d using(department_id)

-- örnek
-- or replace diyerek de view varsa değiştirilmesini yapar. Eğer eski viewdeki sütunları kaldırıp başka sütunları yazarsak
-- ya da sütunların viewi ilk oluşturma sıralamasını değiştirirsek veya sadece kaldırırsak hata verecektir. Çünkü viewi oluştururken
 -- her bir sütun için bir index verir ve id verir. Ve biz de bu viewi aralara sütunlar koyarak değiştiremeyiz. 
 -- Sadece sütunların sonuna ekleyebiliriz sorguda. where diyerek vs şartta bir sıkıntı yok.
create or replace view vw_emp_information 
as
select 
	e.first_name || ' ' || e.last_name as emp_name,
	m.first_name || ' ' || m.last_name as man_name,
	(
		select count(*) from dependents d
		where d.employee_id = e.employee_id
	) as dep_count
from employees e, employees m -- burada self join yaptık çünkü manager ve çalışanları aynı tabloda yazıyorduk ya
where e.employee_id = m.manager_id;

select * from vw_emp_information where dep_count > 0;

-- viewin silinmesi
drop view if exists vw_emp_info; -- eğer silmek istediğimiz bir view başka bir view içerisinde varsa hata verecektir. 
-- Bunu çözmenin yolu:
drop view if exists vw_emp_info cascade; -- bu da tehlikeli çünkü ana viewi ve ona bağlı olan diğer viewleri de siler.

--güncellenebilir view: nadiren de olsa kullanılmaktadır.
-- bir veri güncellenebilir ama en basit halinde olması gerekir. from dan sonra bir tane tablo olması gerekir. joinli tabloları
-- güncelleyemeyiz.
-- şunları da içermemesi gerekir: group by, having, limit, offset, distinct, with, union, intersect ve except
-- set returning gibi fonksiyonlar içermemesi gerekir.
-- sum, count avg gibi vs içermemesi gerekir.
-- update view dediğimizde o tablodaki verileri güncelleyebiliriz.

create view student_engineer as
select * from student
where course_name ilike '%engineer%';

update student_engineer
set email = regexp_replace(lower(name),'[\s]','','g') || '@engineer.com' -- sadece update yaptığımızı düşünme delete ve insert de
-- yapabiliriz.
