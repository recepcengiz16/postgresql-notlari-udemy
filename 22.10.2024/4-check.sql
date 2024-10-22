-- check constraint: bir değerin kontrol edilip ondan sonra insert ya da update yapılmasını sağlar. Aksi takdirde hata verir.
create table employees_new (
	id serial primary key, --serialda hata olunca o counter artmaya devam eder.
	first_name varchar(50),
	last_name varchar(50),
	birth_date check( birth_date > '1980-01-01' ),
	joined_date check( joined_date > birth_date ), -- bir sütunda başka bir sütuna göre de kontrol etmiş oluyoruz
	salary numeric check(salary between 5000 and 10000),
	emp_type varchar(1) check(emptype in ('A','B','C'))
)

--var olan bir tabloya eklenmesi
alter table employees
add constraint emp_type_check
check(emp_type in ('A','B','C'));