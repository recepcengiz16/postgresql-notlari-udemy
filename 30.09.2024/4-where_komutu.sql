-- where komutu: satırlarda filtreleme yapmamızı sağlar.

-- <> ve != her ikisi de eşit değil anlamında
-- metinsel ifadeler tek tırnak içinde yazılır.
-- karşılaştırma operatörleri <, >, >=, <=, =, != gibi
select * from actor where actor_id=1;

select * from film where length >= 100;