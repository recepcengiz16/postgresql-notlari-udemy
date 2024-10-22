-- foreign key: bir veya daha fazla sütunun başka bir tablodaki sütunun değerine referans etmesidir. Ve o sütun da primary key
-- olmalıdır. Bir tabloda birden fazla fk olabilir.

--constraint eklenirken postgresql ve diğer veritabanları kontrol yaparlar uyuşmazlık olan datalar var mı diye. Eğer sıkıntı yoksa
-- var olan tabloya constraint ekleyebiliriz.

--table create edilirkenki syntax
[constraint fk_name] -- constraint diyip ismini veriyoruz.
	foreign key(fk_columns) -- sütun veya sütunları koyuyoruz buraya
	references parent_table(parent_table_columns) -- hangi tablodan referans alıyor
	[on delete delete_action] -- ve bu constrainte bağlı olan sütunlar silinirse ne olsun
	[on update update_action] -- ve bu constrainte bağlı olan sütunlar güncellenirken ne olsun

-- var olan tabloda eklenmesi
alter table dependents
add constraint fk_dependents_employee_id -- fk + tabloadı+ sütun ismi daha açıklayıcı olur.
foreign key(employee_id)
references employees (employee_id)

--silinmesi
alter table dependets 
drop constraint fk_dependents_employee_id


-- örnek
create table customers (
	customer_id serial,
	customer_name varchar(50),
	primary key(customer_id)
)

create table contacts (
	contact_id serial,
	contact_name varchar(50) not null,
	customer_id int -- orada serial burada int yazdık çünkü serial da integerdı 
	primary key(contact_id)
	constraint fk_customer
		foreign key(customer_id)
		references customers(customer_id)
		--on delete set null
		--on delete cascade
)

--eğer biz on delete set null ve on delete cascade ifadesini yazmadığımızda referans tablosundan bir değer silinmesine müsaade etmez
-- şunu diyor bu kayıta bağlı başka bir tabloda kayıt var constraint kısıtlı ve sen oraya referans etmişsin bu satırı o yüzden 
-- silemezsin der.

-- on delete set null: bununla da referans edilen tablodan kayıt silinince fk olan tablodaki kayıtlardaki o sütunu
--null yap demiş oluyoruz.
-- on delete cascade: bununla da referans edilen tablodan kayıt silinince fk olan tablodaki kayıtları da sil demiş oluyoruz bununla
